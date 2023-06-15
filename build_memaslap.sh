# libmemcached tests require memcached
sudo systemctl restart memcached
# https://medium.com/swlh/the-complete-guide-to-benchmark-the-performance-of-memcached-on-ubuntu-16-04-71edeaf6e740
# as per build instructions above 
export LDFLAGS="-L/lib64 -lpthread"
# set up for package
mkdir -p ${HOME}/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
# fetched previously
cd libmemcached-1.0.18
# from this repo add makefile and spec for memaslap
cp ../memaslap.* .
# as per build instructions
./configure --enable-memaslap
# fix up to ensure compile succeeds
sed -i 's/opt_servers == false/opt_servers == NULL/g' clients/memflush.cc
# build rpm
make -f memaslap.makefile >> make.log

# test
# make check >> make.log
# install
# sudo make install >> make.log
# remove dependencies on existing elements in /usr/bin
# sed -i 's/BuildRequires/\#BuildRequires/g' support/libmemcached.spec
# do not make debug rpm, unresolved issues
# sed -i 's/libmemcached-debuginfo/libmemcached-devel/' Makefile
#package
#make rpm  >> make.log
