# libmemcached tests require memcached
# sudo systemctl restart memcached
# https://medium.com/swlh/the-complete-guide-to-benchmark-the-performance-of-memcached-on-ubuntu-16-04-71edeaf6e740
# as per build instructions above 
export LDFLAGS="-L/lib64 -lpthread"
# fetched previously
cd libmemcached-1.0.18
# as per build instructions
./configure --enable-memaslap
# fix up to ensure compile succeeds
# sed -i 's/opt_servers == false/opt_servers == NULL/g' clients/memflush.cc
# build memaslap
make clients/memaslap
sudo ln -fs `pwd`/clients/memaslap /usr/bin
# set up for package
# mkdir -p ${HOME}/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
