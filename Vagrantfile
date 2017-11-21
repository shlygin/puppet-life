# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.define "puppet_test" do |box|
    box.vm.network "private_network", ip: "192.168.168.2"
    box.vm.box = "puppetlabs/centos-7.2-64-puppet"
    box.vm.hostname = "box.vagrant.test"
    box.vm.box_check_update = true
    box.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 1024
    end

    box.vm.provision "shell",
      inline: "sudo rm -rf /etc/yum.repos.d/puppetlabs-pc1.repo ; sudo yum clean all ; sudo yum -y install https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm ; sudo yum -y upgrade puppet-agent-1.10.9-1.el7"
    box.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "vagrant/manifests"
      puppet.manifest_file = "default.pp"
      puppet.options = "--modulepath=/vagrant/vagrant/modules"
    end

  end

end

