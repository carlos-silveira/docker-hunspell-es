FROM alpine:latest
MAINTAINER Carlos Silveira <silveira.alberto24@gmail.com>

ARG HUNSPELL_BASE_URL="http://download.services.openoffice.org/contrib/dictionaries"

RUN apk add --no-cache \
    hunspell 

RUN mkdir -p /usr/share/hunspell \
  && wget -O /usr/share/hunspell/es_MX.aff "https://raw.githubusercontent.com/elastic/hunspell/master/dicts/es_MX/es_MX.aff" \
  && wget -O /usr/share/hunspell/es_MX.dic "https://raw.githubusercontent.com/elastic/hunspell/master/dicts/es_MX/es_MX.dic"

RUN ln -s /usr/share/hunspell/es_MX.aff /usr/share/hunspell/default.aff \
  && ln -s /usr/share/hunspell/es_MX.dic /usr/share/hunspell/default.dic

COPY entrypoint.sh /

WORKDIR /workdir
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
