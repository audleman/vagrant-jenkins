Vagrant.configure("2") do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.network :forwarded_port, guest: 8080, host:8080, auto_correct: true

  config.vm.synced_folder "jenkins", "/home/vagrant/jenkins"
  config.vm.synced_folder "jenkins/salt", "/srv/salt"
end
