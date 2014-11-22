#!/bin/bash
set -e

cat >> make_package.sh << __EOF__
#!/bin/bash
set -e
__EOF__

echo -n "fpm -f -m info@openrov.com -s dir -t deb -a armhf -n openrov-onrov-suite" >> make_package.sh

while read package; do
  echo -n package | awk '-d {print $1."\"}' >> make_package.sh
done < manifest


echo -n "-v $VERSION_NUMBER-$REAL_GIT_BRANCH --description 'OpenROV suite of projects that run on the ROV directly' .=/opt/openrov" >> make_package.sh
