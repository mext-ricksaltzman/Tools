# libmemcached tests require memcached
# sudo systemctl restart memcached
# https://medium.com/swlh/the-complete-guide-to-benchmark-the-performance-of-memcached-on-ubuntu-16-04-71edeaf6e740
# as per build instructions above 
make
#mkdir -p ${HOME}/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
#cp *spec ${HOME}/rpmbuild/SPECS
#cp *gz ${HOME}/rpmbuild/SOURCES
#rpmbuild -ba ${HOME}/rpmbuild/SPECS/memaslap.spec
