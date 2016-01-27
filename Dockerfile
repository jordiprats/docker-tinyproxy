FROM ubuntu:14.04
MAINTAINER Jordi Prats

ENV HOME /root

RUN mkdir -p /usr/local/src

# timezone and locale
#
RUN echo "Europe/Andorra" > /etc/timezone && \
	dpkg-reconfigure -f noninteractive tzdata

RUN export LANGUAGE=en_US.UTF-8 && \
	export LANG=en_US.UTF-8 && \
	export LC_ALL=en_US.UTF-8 && \
	locale-gen en_US.UTF-8 && \
	DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

RUN DEBIAN_FRONTEND=noninteractive apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install wget -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install tinyproxy -y

COPY tinyproxy.conf /etc/

RUN mkdir -p /var/run/tinyproxy/
RUN chmod 777 /var/run/tinyproxy/

EXPOSE 8888

CMD /usr/sbin/tinyproxy -d
