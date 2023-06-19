# Hack because I don't know how to use libmemcached-1.0.18/Makefile to make rpm for clients/memaslap

/usr/local/bin/memaslap: memaslap-1.0.18/clients/memaslap
	cd memaslap-1.0.18; make

# create a makefile used by the rpm
memaslap-1.0.18/clients/memaslap: libmemcached-1.0.18/clients/memaslap
	mv libmemcached-1.0.18 memaslap-1.0.18
	echo "# memaslap" > makefile
	echo >> makefile
	echo "install: /usr/local/bin/memaslap" >> makefile
	echo >> makefile
	echo "/usr/local/bin/memaslap: clients/memaslap" >> makefile
	echo "\tsudo ln -sf \`pwd\`/clients/memaslap /usr/local/bin" >> makefile
	echo "\tsudo ln -sf \`pwd\`/clients/memaslap /usr/local/bin/memslap" >> makefile
	echo >> makefile
	mv makefile memaslap-1.0.18/
	tar -czf memaslap-1.0.18.tar.gz memaslap-1.0.18

# export documented in the URL below
libmemcached-1.0.18/clients/memaslap: libmemcached-1.0.18/Makefile
	#commented attempts which did not work
	#export LDFLAGS="-L/lib64 -lpthread"
	#sed -i '1s;^;export LDFLAGS="-L/lib64 -lpthread"\n;' libmemcached-1.0.18/Makefile
	#cd libmemcached-1.0.18; export LDFLAGS="-L/lib64 -lpthread"; make clients/memaslap
	cd libmemcached-1.0.18; make -e LDFLAGS="-L/lib64 -lpthread" clients/memaslap

# attempt to include sasl via apt-get installs did not resolve the warning
libmemcached-1.0.18/Makefile: libmemcached-1.0.18/config.status
	echo "sasl libs not installed"
	cd libmemcached-1.0.18; ./configure --enable-memaslap
	#configure: WARNING: request to add sasl support failed

libmemcached-1.0.18/config.status: libmemcached-1.0.18.tar.gz
	tar -zxf libmemcached-1.0.18.tar.gz

# ubuntu build source
libmemcached-1.0.18.tar.gz:
	wget https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz

clean:
	rm -fr memaslap-1.0.18 memaslap-1.0.18.tar.gz

# mkdir -p ${HOME}/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
