Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v|
        v.name = "Default"
        v.customize [
            "modifyvm", :id,
            "--name", "Default",
            "--memory", 512,
            "--natdnshostresolver1", "on",
            "--cpus", 1,
        ]
    end

    config.vm.box = "ubuntu/trusty64"

    config.vm.box_url = "https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box"

    config.vm.network :private_network, ip: "192.168.33.99"
    config.ssh.forward_agent = true


    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/playbook.yml"
        ansible.inventory_path = "ansible/inventories/dev"
        ansible.limit = 'all'
        ansible.extra_vars = {
            private_interface: "192.168.33.99",
            hostname: "ror-vansible"
        }
        ansible.verbose = "true"

    end

    config.vm.synced_folder "./", "/vagrant", type: "nfs"
end
