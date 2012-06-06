# a default instance
Vagrant::Config.run do |config|
  
  config.vm.define :instance do |instance_config|
    instance_config.vm.box = "precise64"
    instance_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    instance_config.vm.network :hostonly, "192.168.1.12"
    instance_config.vm.customize ["modifyvm", :id, "--memory", "512"]
    instance_config.vm.customize ["modifyvm", :id, "--name", "Default Instance Instance"]
    instance_config.vm.customize ["storagectl", :id, "--name", "SATA Controller", "--hostiocache", "on"]
    
    instance_config.vm.provision :puppet do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet/instance_manifest"
    end
  end
  
end

# test instance
Vagrant::Config.run do |config|
  
  config.vm.define :test do |test_config|
    test_config.vm.box = "precise64"
    test_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    test_config.vm.forward_port 80, 8080
    #test_config.vm.network :bridged
    test_config.vm.network :hostonly, "192.168.1.13"
    test_config.vm.customize ["modifyvm", :id, "--memory", "512"]
    test_config.vm.customize ["modifyvm", :id, "--name", "Test Instance"]
    test_config.vm.customize ["storagectl", :id, "--name", "SATA Controller", "--hostiocache", "on"]
    
    test_config.vm.provision :puppet do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet/test_manifest"
    end
  end
  
end
