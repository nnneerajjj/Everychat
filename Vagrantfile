Vagrant.configure(2) do |config|
  config.vm.box = 'trusty64'
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'

  config.vm.network :forwarded_port, guest: 5000, host: 5000
  config.vm.network :private_network, ip: '192.168.33.10'

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
end
