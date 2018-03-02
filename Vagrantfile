# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

###DEFINE ELASTIC HOST###
 config.vm.define "elastic" do |e|
  e.vm.box              = "base"
  e.vm.box_check_update = false
  e.vm.box              = "puppetlabs/ubuntu-16.04-64-puppet"
  e.vm.hostname         = "elastic"
  e.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 4
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  e.vm.network "forwarded_port", guest: 9200, host: 9200, host_ip: "127.0.0.1"
  e.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  end

###PUPPET APPLY###
  config.vm.synced_folder "hieradata", "/tmp/vagrant-puppet/hieradata"
  config.vm.provision :puppet, :options => ["--yamldir /hieradata"] do |p|
    p.manifests_path    = "manifests"
    p.manifest_file     = "site.pp"
    p.module_path       = "modules"
    p.hiera_config_path = "hiera.yaml"
    p.working_directory = "/tmp/vagrant-puppet/"
    p.facter = {
    }
  end
end
