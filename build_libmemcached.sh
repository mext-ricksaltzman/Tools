export LDFLAGS="-L/lib64 -lpthread"; 
cd libmemcached-1.0.18
./configure --enable-memaslap # --prefix=/usr/local
sed -i 's/opt_servers == false/opt_servers == NULL/g' clients/memflush.cc
make && make dist
#make rpm # fails
#sudo apt-get install libmemcached # does not contain memaslap
#sudo make install # adds memaslap
