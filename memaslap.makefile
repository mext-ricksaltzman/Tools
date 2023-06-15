tool=memaslap
version=1.0.18
libmemcached=~/libmemcached-1.0.18

rpm: memaslap-1.0.18.tar.gz memaslap.spec
	cp memaslap-1.0.18.tar.gz ../rpmbuild/SOURCES
	cp memaslap.spec ../rpmbuild/SPECS
	rpmbuild -ba ../rpmbuild/SPECS/memaslap.spec

memaslap-1.0.18.tar.gz: clients/memaslap man/memaslap.1
	rm -fr memaslap-1.0.18
	mkdir memaslap-1.0.18
	install -m 755 clients/memaslap memaslap-1.0.18
	install -m 0644 man/memaslap.1 memaslap-1.0.18
	gzip memaslap-1.0.18/memaslap.1
	tar -czf $@ memaslap-1.0.18
	rm -fr memaslap-1.0.18

clients/memaslap:
	make clients/memaslap
	
install: 
	install -m 755 clients/memaslap /usr/bin

clean:
	rm clients/memaslap memaslap-1.0.18.tar.gz

PHONY: memaslap.1 memaslap.spec install

