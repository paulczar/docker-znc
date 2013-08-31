# This file creates a container that runs ZNC
#
# Author: Paul Czarkowski
# Date: 08/04/2013


FROM ubuntu:12.10
MAINTAINER Paul Czarkowski "paul@paulcz.net"

RUN apt-get update
RUN apt-get -y install znc

ADD start-znc /usr/local/bin/start-znc
ADD znc.pem /opt/znc/znc.pem
ADD znc.conf /opt/znc/configs/znc.conf

RUN chmod +x /usr/local/bin/start-znc 

RUN useradd znc
RUN chown -R znc:znc /opt/znc

EXPOSE 6667

# Start znc
CMD ["start-znc"]

