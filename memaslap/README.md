# Tools
For Testing, etc
## memaslap in libmemcached
Build memaslap https://medium.com/swlh/the-complete-guide-to-benchmark-the-performance-of-memcached-on-ubuntu-16-04-71edeaf6e740.  
memaslap.tar.gz is created and published. See `memaslap/makefile.memaslap`, TBD create rpm  
Download memaslap.zip and softlink the executable
```
unzip memaslap.zip
tar -xzf memaslap-*.tar.gz
cd memaslap-
sudo ln -s `pwd`/clients/memaslap /usr/local/bin
``` 

Notes:  
github runner ubuntu-20.04 build succeeds, ubuntu-22.04 (ubuntu-latest) fails for full build of libmemcached.  
vagrant 'ubuntu/focal64' version '20230607.0.0' build succeeds.  
