export LDFLAGS="-L/lib64 -lpthread"; 
cd libmemcached-1.0.18
./configure --enable-memaslap # --prefix=/usr/local
sed -i 's/opt_servers == false/opt_servers == NULL/g' clients/memflush.cc
make && make dist
#sudo make install
