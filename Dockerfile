ARG arch=
FROM ${arch}ruby:3.0-alpine
WORKDIR /usr/src/app

RUN apk add --no-cache build-base gcc bash cmake git
COPY docker_entry.sh /usr/bin/docker_entry.sh
RUN chmod +x /usr/bin/docker_entry.sh && gem install bundler jekyll

EXPOSE 4000
ENTRYPOINT [ "docker_entry.sh" ]
CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--verbose", "--host", "0.0.0.0"]

