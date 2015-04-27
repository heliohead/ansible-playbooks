Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/trusty64"

    config.vm.box_url = "https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box"
    config.ssh.forward_agent = true
    config.vm.network :forwarded_port, host: 8000, guest: 8080

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
