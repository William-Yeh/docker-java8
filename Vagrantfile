# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"



#
# provision script; pull Docker image
#
docker_image = "williamyeh/java8"
$script = <<SCRIPT
echo Downloading Docker image: \'#{docker_image}\'...
echo This may take minutes...

docker pull #{docker_image}
if [[ $? -eq 0 ]]; then
  echo Done.
else
  echo ERROR when pulling Docker image!
fi
SCRIPT



Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "yungsang/coreos"


  # Use docker-tcp.socket to expose the port 4243
  #config.vm.network "forwarded_port", guest: 4243, host: 4243


  # shared folder via NFS;
  # @see https://coreos.com/docs/running-coreos/platforms/vagrant/
  # @see http://stackoverflow.com/a/22642197/714426
  config.vm.synced_folder ".", "/vagrant", id: "core", type: "nfs", mount_options: ['nolock,vers=3,udp']


  config.vm.provision :shell, :inline => $script

  config.vm.provider "virtualbox" do |vb|
    config.vm.network "private_network", ip: "192.168.10.10"
    vb.memory = 2048
    #vb.gui = true
  end

end
