Name:       hello-world
Version:    1
Release:    2
Summary:    Most simple RPM package
License:    None

%description
Example rpm for general use

%prep
# we have no source, so nothing here

%build
cat > hello-world.sh <<EOF
#!/usr/bin/bash
echo Hello world
EOF

%install
mkdir -p %{buildroot}/usr/bin/
install -m 755 hello-world.sh %{buildroot}/usr/bin/hello-world.sh

%files
/usr/bin/hello-world.sh

%changelog
* Fri Jun 16 2002 <rick.saltzman@mext.one>
- Creation
