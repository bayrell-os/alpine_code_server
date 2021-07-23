ARG ARCH=
FROM docker.io/bayrell/alpine_php_fpm:7.4-1${ARCH}

ENV GOROOT /usr/lib/go
ENV GOPATH /data/golang

RUN cd ~; \
	apk update; \
	apk add nodejs npm util-linux gcc g++ make sudo git musl-dev go; \
	rm -rf /var/cache/apk/*; \
	echo n |npm install -g @angular/cli; \
	npm install -g parcel-bundler; \
	npm install -g @vue/cli; \
	echo 'Ok'

ADD files /src
ADD downloads /src/downloads
RUN cd /src/downloads; \
	tar -xzf code-server-3.11.0-linux-amd64.tar.gz; \
	cp -r code-server-3.11.0-linux-amd64 /usr/lib/code-server; \
	cp -rf /src/files/etc/* /etc/; \
	cp -rf /src/files/root/* /root/; \
	rm -rf /src/*; \
	echo 'Ok'
