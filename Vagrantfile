#-*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-14.04"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 8888, host: 8080

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "python-machine-learning-test-env::default"
  end

end
