if [ ! -d /data/code-server ]; then
	mkdir -p /data/code-server
	chown www:www /data/code-server
fi
sed -i 's|$ROOT/lib/node|/usr/bin/node|g' /usr/lib/code-server/bin/code-server