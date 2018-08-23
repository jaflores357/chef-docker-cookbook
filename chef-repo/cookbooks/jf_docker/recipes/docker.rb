#
# Cookbook Name:: jf_docker
# Recipe:: docker
# Author: Jorge Flores
#
# Copyright (C) 2017 jf_docker | Mobile Results
#
# All rights reserved - Do Not Redistribute
#

#config = node['jf_docker']
config = node['jf_docker']['docker']

resource_types = config.select { |key| key.start_with? 'docker_' }
resource_types.each_pair do |type, resources|
  resources.each_pair do |name, resource_conf|
    resource = send(type.to_sym, name)
    (resource_conf || {}).each_pair do |key, value|
      value = [value] unless value.is_a? Array
      resource.send(key, *value)
    end
  end
end

if node['jf_docker']['docker']['auths'].nil?

  unless node['jf_docker']['docker']['auth'].nil?

    directory '/root/.docker' do
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    template '/root/.docker/config.json' do
      source 'docker_config.json.erb'
      owner 'root'
      mode '0644'
      action :create
    end
  end

else

  directory '/root/.docker' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
  template '/root/.docker/config.json' do
    variables(
      data: node['jf_docker']['docker']['auths']
    )
    source 'auths_config.erb'
    owner 'root'
    mode '0644'
    action :create
  end
end
