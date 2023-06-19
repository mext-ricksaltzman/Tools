# libmemcached tests require memcached
# sudo systemctl restart memcached
# https://medium.com/swlh/the-complete-guide-to-benchmark-the-performance-of-memcached-on-ubuntu-16-04-71edeaf6e740
# as per build instructions above 
make
mkdir -p ${HOME}/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
cp *spec ${HOME}/rpmbuild/SPECS
cp libmemcached-memaslap-1.0.18.tar.gz ${HOME}/rpmbuild/SOURCES/libmemcached-1.0.18.tar.gz
rpmbuild -ba ${HOME}/rpmbuild/SPECS/memaslap.spec
