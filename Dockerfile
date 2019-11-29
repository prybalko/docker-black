FROM alpine:3.9 as builder

RUN set -eux \
	&& apk add --no-cache \
		bc \
		gcc \
		musl-dev \
		python3 \
		python3-dev

ARG VERSION=latest
RUN set -eux \
	&& if [ "${VERSION}" = "latest" ]; then \
		pip3 install --no-cache-dir --no-compile black; \
	else \
		pip3 install --no-cache-dir --no-compile "black==${VERSION}"; \
	fi \
	\
	&& black --version | grep -E '^black.+?version\s[0-9]+' \
	\
	&& find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
	&& find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf


FROM alpine:3.9 as production
LABEL \
	maintainer="Pavel Rybalko <paul.rybalko@gmail.com>" \
	repo="https://github.com/prybalko/docker-black"
RUN set -eux \
	&& apk add --no-cache python3 \
	&& ln -sf /usr/bin/python3 /usr/bin/python \
	&& find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
	&& find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf
COPY --from=builder /usr/lib/python3.6/site-packages/ /usr/lib/python3.6/site-packages/
COPY --from=builder /usr/bin/black /usr/bin/black
WORKDIR /data
ENTRYPOINT ["black"]
