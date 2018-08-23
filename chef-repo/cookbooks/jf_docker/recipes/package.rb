#
# Cookbook Name:: jf_docker
# Recipe:: package
# Author: Jorge Flores
#
# Copyright (C) 2017 jf_docker | Mobile Results
#
# All rights reserved - Do Not Redistribute
#

# pkg_version = node['jf_docker']['version']
pkg_version = node["jf_docker"]["docker"]["version"]

# Install Docker CE
package "docker-ce" do
  version pkg_version unless pkg_version == "latest"
  action :upgrade if pkg_version == "latest"
  retries node["jf_docker"]["docker"]["package_retries"]
  not_if "rpm -q docker-ce"
end

# Install epel-release repo
# yum install -y epel-release
yum_package "epel-release" do
  action :install
  not_if "rpm -q epel-release"
end

yum_package "git" do
  action :install
  not_if "rpm -q git"
end

yum_package "python-pip" do
  action :install
  not_if "rpm -q python-pip"
end

# Upgrade pip
execute "pip_upgrade" do
  command "pip install --upgrade pip"
  action :run
end

# Install docker-compose
execute "docker_compose_install" do
  command "pip install docker-compose"
  action :run
  not_if "pip list |grep docker-compose"
end

# Install python-pip
# yum upgrade -y python*
yum_package "python" do
  action :upgrade
end
