FROM alpine:3.10

RUN \
	apk add --no-cache lighttpd perl-cgi gitolite git-gitweb git-daemon highlight openssh bash curl \
	&& passwd -u git && adduser lighttpd git

VOLUME /etc/ssh/keys
VOLUME /var/lib/git

COPY docker-entrypoint /
COPY gitweb.conf /etc/
COPY lighttpd.conf /etc/lighttpd/

ENTRYPOINT [ "/docker-entrypoint" ]

EXPOSE 80 22

CMD [ "sshd" ]
