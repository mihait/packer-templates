apt-get update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev
apt-get -y install curl unzip

echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant
echo "UseDNS no" >> /etc/ssh/sshd_config

# Add puppet
wget http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
dpkg -i puppetlabs-release-wheezy.deb
apt-get update

apt-get install -y puppet facter
rm -f puppetlabs-release-wheezy.deb

