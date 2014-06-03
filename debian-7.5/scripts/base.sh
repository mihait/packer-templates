apt-get update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev
apt-get -y install curl unzip

echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant
echo "UseDNS no" >> /etc/ssh/sshd_config


