# -*- mode: ruby -*-
# vi: set ft=ruby :

# README
#
# Getting Started:
# 1. vagrant plugin install vagrant-hostmanager
# 2. vagrant up
# 3. vagrant ssh
#
# This should put you at the control host
#  with access, by name, to other vms
Vagrant.configure(2) do |config|

  config.hostmanager.enabled = true
  config.vm.box = "centos/7"

  config.vm.define "chef-server" do |h|
    h.vm.network "private_network", ip: "192.168.136.101"
  end

  config.vm.define "app01" do |h|
    h.vm.network "private_network", ip: "192.168.136.111"
  end


end

