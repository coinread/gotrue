FROM alpine:3.7
RUN apk add --no-cache ca-certificates dos2unix
ADD gotrue /usr/local/bin/gotrue
ADD migrations /usr/local/etc/gotrue/migrations/

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat
RUN dos2unix /usr/local/bin/docker-entrypoint.sh

ENV GOTRUE_DB_MIGRATIONS_PATH /usr/local/etc/gotrue/migrations
ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["gotrue"]