FROM debian:10.9

RUN apt-get -qqy update
RUN apt-get -y install python3.5=3.5.3-1+deb9u1 g++-6=6.3.0-18+deb9u1 gcc-6=6.3.0-18+deb9u1 openjdk-8-jdk
RUN apt-get -qqy install postgresql-client gettext python2.7 iso-codes shared-mime-info stl-manual cgroup-bin supervisor libcap-dev
RUN apt-get -qqy install python-dev libpq-dev libcups2-dev libyaml-dev libffi-dev
RUN apt-get -qqy install git wget zip
RUN wget http://eio.ee/get-pip.py
RUN python2 get-pip.py

ARG CMS_REPO=ahtotruu/cms
ARG CMS_BRANCH=boi
ARG CMS_COMMIT=f68a5b4d000ca3d7aa7e6ad108b4cdd85c7dbef0

RUN git clone --branch $CMS_BRANCH --depth 1 https://github.com/$CMS_REPO.git /cms && \
    cd /cms && \
    git checkout -q $CMS_COMMIT && \
    git submodule update --init && \
    pip2 install -r requirements.txt && \
    python2 prerequisites.py -y --no-conf --as-root install && \
    python2 setup.py install

COPY cms.conf /usr/local/etc/cms.conf
