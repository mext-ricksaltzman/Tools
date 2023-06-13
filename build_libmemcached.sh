# libmemcached tests require memcached
sudo systemctl restart memcached
# https://medium.com/swlh/the-complete-guide-to-benchmark-the-performance-of-memcached-on-ubuntu-16-04-71edeaf6e740
# as per build instructions above 
export LDFLAGS="-L/lib64 -lpthread"
# build this
cd libmemcached-1.0.18
# as per build instructions cited above
./configure --enable-memaslap
# fix up to ensure compile succeeds
sed -i 's/opt_servers == false/opt_servers == NULL/g' clients/memflush.cc
# build for distribution
make && make dist && make check > make.log
# install
sudo make install >> make.log
# set up for package
mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
# fails due to dependencies on existing elements in /uar/bin
make rpm  >> make.log
