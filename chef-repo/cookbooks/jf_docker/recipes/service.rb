#
# Cookbook Name:: jf_docker
# Recipe:: service
# Author: Jorge Flores
#
# Copyright (C) 2017 jf_docker | Mobile Results
#
# All rights reserved - Do Not Redistribute
#


#docker_installation 'default' do
#  action :create
#end
#

# Enable Docker Service
# execute 'enable_docker_service' do
#   command 'systemctl enable docker'
#   action :run
#   not_if { ::File.symlink?("/etc/systemd/system/multi-user.target.wants/docker.service") }
docker_service 'default' do
  action [:create, :start]
end
