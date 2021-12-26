# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant multi-machine sample setup

servers=[
  {
    :hostname => "inno1",
    :ip => "192.168.56.121",
    :box => "stefanVagrant/InnoDBcluster",
    :ram => 1024,
    :cpu => 1
  },
  {
    :hostname => "inno2",
    :ip => "192.168.56.122",
    :box => "stefanVagrant/InnoDBcluster",
    :ram => 1024,
    :cpu => 1
  },
  {
    :hostname => "inno3",
    :ip => "192.168.56.123",
    :box => "stefanVagrant/InnoDBcluster",
    :ram => 1024,
    :cpu => 1
  },
  {
    :hostname => "router",
    :ip => "192.168.56.100",
    :box => "stefanVagrant/InnoDBcluster",
    :ram => 1024,
    :cpu => 1 
  }
]

#last_vm = servers[(servers.length) -1][:hostname]

Vagrant.configure(2) do |config|
    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = machine[:box]
            node.vm.hostname = machine[:hostname]
            node.vm.network "private_network", ip: machine[:ip]
			node.vm.provision "shell", path: "setup.sh"
            node.vm.provider "virtualbox" do |vb|
                vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
            end
            node.trigger.after :up do |trigger|
                #trigger.only_on =  
				node.vm.provision "shell", path: "cluster.sh"
                trigger.info = "Running only after last machine is up!"
            end
        end
    end
end

