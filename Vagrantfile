# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  ####
  # LoadBalancer
  config.vm.define :loadbalancer do |loadb|
    loadb.vm.provider "virtualbox" do |vb|
      vb.name = "loadbalancer"
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--vram", "128"]
    end
    
    loadb.vm.hostname = "loadbalancer"
    loadb.vm.network "private_network", ip: "192.168.50.4"

    loadb.vm.provision :shell, inline: "setenforce 0"

    loadb.vm.provision :chef_zero do |chef|
      chef.cookbooks_path = [ 'cookbooks', 'site-cookbooks' ]
      chef.data_bags_path = "data_bags"
      chef.nodes_path = "nodes"
      chef.roles_path = "roles"

      chef.json = {
        "loadbalancer" => {
          "nginx" => {
            "upstream" => [
              "192.168.50.5:8080",
              "192.168.50.6:8080"
            ]
          }
        }
      }
      chef.add_recipe "loadbalancer::nginx"
    end
  end

  ####
  # APP1
  config.vm.define :app1 do |app1|
    app1.vm.provider "virtualbox" do |vb|
      vb.name = "app1"
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--vram", "128"]
    end
    
    app1.vm.hostname = "app1"
    app1.vm.network "private_network", ip: "192.168.50.5"

    app1.vm.provision :chef_zero do |chef|
      chef.cookbooks_path = [ 'cookbooks', 'site-cookbooks' ]
      chef.data_bags_path = "data_bags"
      chef.nodes_path = "nodes"
      chef.roles_path = "roles"

      chef.add_recipe "goapp::default"
    end
  end

  ####
  # APP2
  config.vm.define :app2 do |app2|
    app2.vm.provider "virtualbox" do |vb|
      vb.name = "app2"
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--vram", "128"]
    end
    
    app2.vm.hostname = "app2"
    app2.vm.network "private_network", ip: "192.168.50.6"

    app2.vm.provision :chef_zero do |chef|
      chef.cookbooks_path = [ 'cookbooks', 'site-cookbooks' ]
      chef.data_bags_path = "data_bags"
      chef.nodes_path = "nodes"
      chef.roles_path = "roles"

      chef.add_recipe "goapp::default"
    end
  end
end
