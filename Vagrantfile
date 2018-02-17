# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

###BASE CONFIGS####
  config.vm.box = "base"
  config.vm.box_check_update = false
  config.vm.box = "puppetlabs/ubuntu-16.04-64-puppet"
  config.vm.define "bro"

###SET VIRTUALBOX SPECS###
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
###PUPPET APPLY###
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "site.pp"
    puppet.module_path = "modules"
  end

end
