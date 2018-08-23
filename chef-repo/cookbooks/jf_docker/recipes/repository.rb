#
# Cookbook Name:: jf_docker
# Recipe:: repository
# Author: Jorge Flores
#
# Copyright (C) 2017 jf_docker | Mobile Results
#
# All rights reserved - Do Not Redistribute
#

# Install dependencies
yum_package "yum-utils" do
  action :install
  not_if "rpm -q yum-utils"
end

# Create Docker Repo
execute "yum_config_docker_repo" do
  command "yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo"
  action :run
  not_if { ::File.exists?("/etc/yum.repos.d/docker-ce.repo") }
end

# Rebuild yum packages index
execute "yum_update_package_index" do
  command "yum makecache fast"
  action :run
  not_if { ::File.exists?("/etc/yum.repos.d/docker-ce.repo") }
end
