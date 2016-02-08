apt-get update -y
apt-get upgrade -y
apt-get install -y git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev \
  postgresql libpq-dev zlib1g-dev nodejs redis-server

source /vagrant/provision/rbenv.sh

cp /vagrant/provision/sudoers /etc/sudoers
