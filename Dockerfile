ARG arch=
FROM ${arch}ruby:3.0-alpine

RUN apk add --no-cache build-base gcc bash cmake git

WORKDIR /usr/src/app

COPY docker_entry.sh /usr/local/bin

RUN gem install bundler jekyll

EXPOSE 4000

ENTRYPOINT [ "docker_entry.sh" ]

CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--verbose", "--host", "0.0.0.0"]

