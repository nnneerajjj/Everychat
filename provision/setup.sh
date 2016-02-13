apt-get update -y
apt-get upgrade -y
apt-get install -y git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev \
  postgresql libpq-dev zlib1g-dev nodejs redis-server

echo 'export RBENV_ROOT="/usr/local/rbenv"' | tee -a /etc/profile.d/rbenv.sh
echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"'| tee -a /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' | tee -a /etc/profile.d/rbenv.sh
source /etc/profile.d/rbenv.sh

git clone https://github.com/rbenv/rbenv.git ${RBENV_ROOT}
git clone https://github.com/rbenv/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build

rbenv install 2.2.4
rbenv global 2.2.4
rbenv rehash

chown -R vagrant ${RBENV_ROOT}

cp /vagrant/provision/sudoers /etc/sudoers
