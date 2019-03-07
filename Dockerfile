FROM debian:9.8

RUN apt-get -qqy update
RUN apt-get -qqy install python3.5=3.5.3-1+deb9u1 g++-6=6.3.0-18+deb9u1 gcc-6=6.3.0-18+deb9u1 openjdk-8-jdk=8u181-b13-2~deb9u1
