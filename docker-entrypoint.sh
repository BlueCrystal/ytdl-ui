#!/bin/bash
set -e

pgid=${PGID:-$(id -u root)}
puid=${PUID:-$(id -g root)}

conf=${CONF_FILE:-"/etc/ytdl_ui.json"}
host=${HOST:-"0.0.0.0"}
port=${PORT:-5000}


if [[ "$*" == python*-m*ytdl_ui* ]]; then
    exec gosu $puid:$pgid "$@" -c $conf --host $host --port $port
fi

exec "$@"
