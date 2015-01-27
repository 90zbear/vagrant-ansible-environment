# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu14"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-web-cloudimg-amd64-vagrant-disk1.box"
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096", "--cpus", "2", "--ioapic", "on"]
  end

  config.vm.define :web, primary: true do |web|
    web.vm.hostname = "web"
    web.vm.network :forwarded_port, guest: 22, host: 2000, id: "ssh"
    web.vm.network :forwarded_port, guest: 80, host: 8000, id: "http"
    web.vm.network :private_network, ip: "192.168.33.12", virtualbox__intnet: "network"
    web.vm.synced_folder "./web", "/var/www/html", :nfs => true, mount_options: ['dmode=777','fmode=666']
  end

  config.vm.define :ansible, autostart: false do |ansible|
    ansible.vm.hostname = "ansible"
    ansible.vm.network :forwarded_port, guest: 22, host: 2001, id: "ssh"
    ansible.vm.network :private_network, ip: "192.168.33.11", virtualbox__intnet: "network"
    ansible.vm.synced_folder "./ansible", "/home/vagrant/ansible", mount_options: ['dmode=777','fmode=666']
    ansible.vm.provision "shell", path: "ansible.sh"
  end

end
