
Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.vm.hostname = "debian"

  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provision "shell", inline: "/vagrant/test.sh"
end
