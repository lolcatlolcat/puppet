# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

###BASE CONFIGS####
  config.vm.box = "base"
  config.vm.box_check_update = false
  config.vm.box = "puppetlabs/ubuntu-16.04-64-puppet"
  config.vm.hostname = "elastic"
  config.vm.define "elastic"

###SET VIRTUALBOX SPECS###
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 3
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

###PUPPET APPLY###
  config.vm.synced_folder "hieradata", "/tmp/vagrant-puppet/hieradata"
  config.vm.provision :puppet, :options => ["--yamldir /hieradata"] do |puppet|
    puppet.manifests_path    = "manifests"
    puppet.manifest_file     = "site.pp"
    puppet.module_path       = "modules"
    puppet.hiera_config_path = "hiera.yaml"
    puppet.working_directory = "/tmp/vagrant-puppet/"
    puppet.facter = {
    }
  end

end
