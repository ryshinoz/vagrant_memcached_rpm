#!/bin/sh

# root
yum install -y rpm-build libevent-devel perl-Test-Simple

# vagrant

su - vagrant -c '
    mkdir -p ~/rpm/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
    echo "%_topdir $HOME/rpm" > ~/.rpmmacros
    wget http://www.memcached.org/files/memcached-1.4.17.tar.gz -P ~
    tar xzf ~/memcached-1.4.17.tar.gz
    cp ~/memcached-1.4.17.tar.gz ~/rpm/SOURCES/
    cp ~/memcached-1.4.17/memcached.spec ~/rpm/SPECS/
    rpmbuild -ba /home/vagrant/rpm/SPECS/memcached.spec
'
