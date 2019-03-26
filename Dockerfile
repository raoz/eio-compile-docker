FROM debian:9.8

ARG CMS_REPO=raoz/cms
ARG CMS_BRANCH=master


RUN apt-get -qqy update
RUN apt-get -y install python3.5=3.5.3-1+deb9u1 g++-6=6.3.0-18+deb9u1 gcc-6=6.3.0-18+deb9u1 openjdk-8-jdk
RUN apt-get -qqy install postgresql-client gettext python2.7 iso-codes shared-mime-info stl-manual cgroup-bin supervisor libcap-dev
RUN apt-get -qqy install python-dev libpq-dev libcups2-dev libyaml-dev libffi-dev
RUN apt-get -qqy install git python-pip
RUN pip install --upgrade pip


RUN git clone --branch $CMS_BRANCH --depth 1 https://github.com/$CMS_REPO.git /cms && \
    cd /cms && \
    git submodule update --init --depth 1 && \
    pip install -r requirements.txt && \
    ./prerequisites.py -y --no-conf --as-root install && \
    python setup.py install && \
    python setup.py compile_catalog

COPY cms.conf /usr/local/etc/cms.conf
