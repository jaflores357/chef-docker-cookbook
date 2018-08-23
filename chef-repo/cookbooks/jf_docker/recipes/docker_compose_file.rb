#
# Cookbook Name:: jf_docker
# Recipe:: docker_compose_file
# Author: Jorge A. Flores
#
# Copyright (C) 2017 jf_docker | Mobile Results
#
# All rights reserved - Do Not Redistribute
#

directory node["jf_docker"]["docker"]["repo_folder"].to_s do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

# Key for git repository
template "/root/.docker_key" do
  source "docker_key.erb"
  mode "0600"
end

# Wrapper to git repository
template "/root/.wrap-ssh4git-docker.sh" do
  source "wrap-ssh4git.sh.erb"
  mode "0700"
end

# Git repository
git node["jf_docker"]["docker"]["repo_folder"].to_s do
  repository node["jf_docker"]["docker"]["repo"].to_s
  reference node["jf_docker"]["docker"]["repo_branch"].to_s
  ssh_wrapper "/root/.wrap-ssh4git-docker.sh"
  enable_checkout false
  checkout_branch node["jf_docker"]["docker"]["repo_branch"].to_s
  revision node["jf_docker"]["docker"]["repo_branch"].to_s
  action :sync
end

# Run docker-compose up to files describe in key compose_files
# and must have in git docker repo
node["jf_docker"]["docker"]["compose_files"].each do |compose_file|
  execute "docker_compose_run" do
    command "export HOSTNAME=#{node.name} ; docker-compose -f #{node["jf_docker"]["docker"]["repo_folder"]}/#{compose_file} up -d "
    action :run
  end
end

unless node["jf_docker"]["docker"]["pos-scripts"].nil?
  node["jf_docker"]["docker"]["pos-scripts"].each do |pos_script|
    execute "docker_compose_pos_script" do
      command pos_script
      action :run
      ignore_failure true
    end
  end
end

unless node["jf_docker"]["docker"]["pos-scripts-run-once"].nil? || ::File.exist?("#{Chef::Config[:file_cache_path]}/docker_compose_pos_script_run_once")
  node["jf_docker"]["docker"]["pos-scripts-run-once"].each do |pos_script_run_once|
    execute "docker_compose_pos_script_run_once" do
      command pos_script_run_once
      action :run
      ignore_failure true
    end
  end
  file "#{Chef::Config[:file_cache_path]}/docker_compose_pos_script_run_once" do
    content "# Chef created file"
    owner "root"
    group "root"
    mode "0755"
    action :create
  end
end
