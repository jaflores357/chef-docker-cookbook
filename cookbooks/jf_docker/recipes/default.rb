#
# Cookbook Name:: jf_docker
# Recipe:: default
# Author: Jorge Flores
#
# Copyright (C) 2017 jf_docker | Mobile Results
#
# All rights reserved - Do Not Redistribute
#

# Install and configure docker images
# include_recipe '#{cookbook_name}::repository'
include_recipe "jf_docker::repository"
# include_recipe '#{cookbook_name}::package'
include_recipe "jf_docker::package"
# include_recipe '#{cookbook_name}::service'
include_recipe "jf_docker::service"
# include_recipe '#{cookbook_name}::docker'
include_recipe "jf_docker::docker"

unless node["jf_docker"]["docker"]["compose_files"].nil?
  include_recipe "jf_docker::docker_compose_file"
end
