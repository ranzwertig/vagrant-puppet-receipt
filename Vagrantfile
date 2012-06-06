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

# apache mysql php instance
Vagrant::Config.run do |config|
  
  config.vm.define :apache_web do |apache_web_config|
    apache_web_config.vm.box = "precise64"
    apache_web_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    apache_web_config.vm.forward_port 80, 8080
    #apache_web_config.vm.network :bridged
    apache_web_config.vm.network :hostonly, "192.168.1.13"
    apache_web_config.vm.customize ["modifyvm", :id, "--memory", "512"]
    apache_web_config.vm.customize ["modifyvm", :id, "--name", "Apache Web Instance"]
    apache_web_config.vm.customize ["storagectl", :id, "--name", "SATA Controller", "--hostiocache", "on"]
    
    apache_web_config.vm.provision :puppet do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet/apache_web_manifest"
    end
  end
  
end
