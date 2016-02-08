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
