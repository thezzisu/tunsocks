FROM ubuntu as builder
WORKDIR /root
RUN apt-get update \
  && apt-get install -y libevent-dev autoconf autotools-dev git build-essential \
  && git clone https://github.com/russdill/tunsocks.git \
  && cd tunsocks \
  && git submodule init \
  && git submodule update \
  && ./autogen.sh \
  && ./configure \
  && make

FROM ubuntu
LABEL maintainer="thezzisu <thezzisu@gmail.com>"
LABEL description=""
RUN apt-get update \
  && apt-get install --no-install-recommends -y libevent-dev openconnect ca-certificates \
  && rm -rf /var/lib/apt/lists/*
COPY --from=builder /root/tunsocks/tunsocks /usr/local/bin/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
