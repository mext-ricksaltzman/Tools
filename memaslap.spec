Name:      memaslap
Summary:   memcached memaslap command line tool
Version:   1.0.18
Release:   1
License:   BSD
Group:     System Environment/Libraries
#URL:       http://launchpad.net/libmemcached
Source0:   %{name}-%{version}.tar.gz

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)


%description
memaslap - Generate testing loads on a memcached cluster.

%prep
%setup -q

#%%build
#%%configure
#%%{__make} %{?_smp_mflags}


%install
mkdir -p %{buildroot}/usr/bin/
mkdir -p %{buildroot}/usr/share/man/man1/
install -m 755 memaslap %{buildroot}/usr/bin/memaslap
install -m 644 memaslap.1.gz %{buildroot}/usr/share/man/man1/
# %%{__rm} -rf %{buildroot}
# %%{__make} install  # DESTDIR="%{buildroot}" AM_INSTALL_PROGRAM_FLAGS=""


#%check
# test suite cannot run in mock (same port use for memcache server on all arch)
# 1 test seems to fail.. 
# %{__make} check


%clean
%{__rm} -rf %{buildroot}


%post -p /sbin/ldconfig


%postun -p /sbin/ldconfig
 

%files
%defattr (-,root,root,-) 
#%%doc AUTHORS COPYING NEWS README THANKS TODO
%{_bindir}/memaslap
%{_mandir}/man1/memaslap.1.gz


%changelog
* Wed Jun 14 2023 Rick Saltzman
- Initial RPM 
- add %%post %%postun %%check section

