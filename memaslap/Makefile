# Hack because I don't know how to use libmemcached-1.0.18/Makefile to make rpm for clients/memaslap

/usr/local/bin/memaslap: libmemcached-1.0.18/clients/memaslap libmemcached-1.0.18/makefile
	cd libmemcached-1.0.18; make install

# create a makefile used by the rpm
libmemcached-1.0.18/makefile: libmemcached-1.0.18/clients/memaslap
	echo "# memaslap" > makefile
	echo >> makefile
	echo "/usr/local/bin/memaslap: clients/memaslap" >> makefile
	echo "\techo \`pwd\`" >> makefile
	echo "\tsudo mkdir -p /usr/local/lib/libmemcached-memaslap-1.0.18/clients/.libs" >> makefile
	echo "\tsudo cp clients/.libs/* /usr/local/lib/libmemcached-memaslap-1.0.18/clients/.libs" >> makefile
	echo "\tsudo cp clients/memaslap /usr/local/lib/libmemcached-memaslap-1.0.18/clients/" >> makefile
	echo "\tsudo ln -sf /usr/local/lib/libmemcached-memaslap-1.0.18/clients/memaslap /usr/local/bin" >> makefile
	echo "\tsudo ln -sf /usr/local/lib/libmemcached-memaslap-1.0.18/clients/memaslap /usr/local/bin/memslap" >> makefile
	echo >> makefile
	echo "install: /usr/local/bin/memaslap" >> makefile
	echo >> makefile
	echo "clean:" >> makefile
	echo "\tmake -f Makefile clean" >> makefile
	mv makefile libmemcached-1.0.18/
	tar -czf libmemcached-memaslap-1.0.18.tar.gz libmemcached-1.0.18

# export documented in the URL below
libmemcached-1.0.18/clients/memaslap: libmemcached-1.0.18/Makefile
	#commented attempts which did not work
	#export LDFLAGS="-L/lib64 -lpthread"
	#sed -i '1s;^;export LDFLAGS="-L/lib64 -lpthread"\n;' libmemcached-1.0.18/Makefile
	#cd libmemcached-1.0.18; export LDFLAGS="-L/lib64 -lpthread"; make clients/memaslap
	cd libmemcached-1.0.18; make -e LDFLAGS='-L/lib64 -lpthread' clients/memaslap
	#export LDFLAGS='-L/lib64 -lpthread'; cd libmemcached-1.0.18; make clients/memaslap

# attempt to include sasl via apt-get installs did not resolve the warning
libmemcached-1.0.18/Makefile: libmemcached-1.0.18/config.status
	# not used for memaslap. To help with rpm builds later.
	cd libmemcached-1.0.18; sed -i 's/opt_servers == false/opt_servers == NULL/g' tests/memflush.cc
	cd libmemcached-1.0.18; ./configure --enable-memaslap
	#configure: WARNING: request to add sasl support failed

libmemcached-1.0.18/config.status: libmemcached-1.0.18.tar.gz
	tar -zxf libmemcached-1.0.18.tar.gz

# ubuntu build source
libmemcached-1.0.18.tar.gz:
	wget https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz

clean:
	# does not work from within this makefile
	@echo "cd libmemcached-1.0.18; make clean"

# mkdir -p ${HOME}/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
