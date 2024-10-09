#!/bin/sh -eux

# Set timezone
if [ -n "${TZ:-}" ]; then
    echo "Setting timezone to ${TZ}"
    echo "${TZ}" > /etc/timezone
    ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime
else
    echo "No TZ variable set. Defaulting to UTC."
    echo "UTC" > /etc/timezone
    ln -snf /usr/share/zoneinfo/UTC /etc/localtime
fi

if [ -n "${WEBDAV_USERNAME:-}" ] && [ -n "${WEBDAV_PASSWORD:-}" ]; then
    htpasswd -cb /etc/nginx/webdavpasswd $WEBDAV_USERNAME $WEBDAV_PASSWORD
else
    echo "No htpasswd config done"
    sed -i 's%auth_basic "Restricted";% %g' /etc/nginx/nginx.conf
    sed -i 's%auth_basic_user_file webdavpasswd;% %g' /etc/nginx/nginx.conf
fi

if [ -n "${UID:-}" ]; then
    chmod go+w /dev/stderr /dev/stdout
    exec gosu $UID "$@"
else
    exec "$@"
fi
