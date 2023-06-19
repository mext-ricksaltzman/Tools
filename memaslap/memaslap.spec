Name:       libmemcached
Version:    1.0.18
Release:    1
Summary:    Most simple RPM package
License:    FIXME
Source0:    %{name}-%{version}.tar.gz

%description
memaslap - a load generation and benchmark tool for memcached servers

%prep

%setup -q


%build
#echo build
./configure --enable-memaslap
rm makefile

%install
make install


%files
#/usr/local/bin/memaslap
%{_sourcedir}/%{name}-%{version}/clients/memaslap
%{_sourcedir}/%{name}-%{version}/clients/.libs/memaslap
%{_sourcedir}/%{name}-%{version}/clients/.libs/utilities.o
%{_sourcedir}/%{name}-%{version}/clients/.libs/libutilities.la
%{_sourcedir}/%{name}-%{version}/clients/.libs/libutilities.a


%clean
rm -rf %{buildroot}

%changelog
* Sat Jun 17 2023 <rick.saltzman@mext.one>
- rpm hack
