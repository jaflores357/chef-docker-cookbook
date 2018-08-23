#
# Cookbook Name:: jf_docker
# Attributes:: default
# Author: Jorge Flores
#
# Copyright (C) 2017 jf_docker | Mobile Results
#
# All rights reserved - Do Not Redistribute
#

# cookbook_name = 'jf_docker'

# default[cookbook_name]['version'] = 'latest'
default["jf_docker"]["docker"]["version"] = "17.06.0.ce-1.el7.centos"

# default[cookbook_name]['yum_repo'] = 'https://yum.dockerproject.org/repo/main/centos/7/'
default["jf_docker"]["docker"]["yum_repo"] = "https://download.docker.com/linux/centos/7/x86_64/stable/"
default["jf_docker"]["docker"]["yum_ce_repo"] = "https://download.docker.com/linux/centos/docker-ce.repo"

# default[cookbook_name]['yum_gpgkey'] = 'https://yum.dockerproject.org/gpg'
default["jf_docker"]["docker"]["yum_gpgkey"] = "https://download.docker.com/linux/centos/gpg"
default["jf_docker"]["docker"]["yum_ce_gpgkey"] = "https://download.docker.com/linux/centos/gpg"

default["jf_docker"]["docker"]["old_packages"] = "docker docker-common docker-selinux docker-engine"

# Systemd unit configuration (used for overrinding the default)
# default[cookbook_name]['systemd_unit'] = {}
default["jf_docker"]["docker"]["systemd_unit"] = {}

# default[cookbook_name]['bin'] = '/bin/docker'
default["jf_docker"]["docker"]["bin"] = "/bin/docker"

# Configure retries for the package resources, default = global default (0)
# (mostly used for test purpose)
# default[cookbook_name]['package_retries'] = nil
default["jf_docker"]["docker"]["package_retries"] = nil

# Create docker networks
# default[cookbook_name]['networks'] = {}

default["jf_docker"]["docker"]["repo"] = "git@bitbucket.org:jf_docker-sms/jf_docker-repo.git"
default["jf_docker"]["docker"]["repo_folder"] = "/opt/jf_docker/utils/jf_docker-repo"
default["jf_docker"]["docker"]["repo_branch"] = "master"

# Application name that will be logged
default["jf_docker"]["docker"]["name"] = "docker"
