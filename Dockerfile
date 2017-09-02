FROM tiredofit/tomcat:8-latest
MAINTAINER Dave Conroy <dave at tiredofit dot ca>

### Install Dependencies
RUN apk update && \
    apk add \
        mariadb-client \
        unzip \
        wget \
        && \
 
### Download Orbeon and Unpack
    cd /usr/src && \
    wget https://github.com/orbeon/orbeon-forms/releases/download/tag-release-2017.1-ce/orbeon-2017.1.201706222342-CE.zip && \
    unzip -d . orbeon-2017.1.201706222342-CE.zip && \
    mkdir -p /usr/local/tomcat/webapps/orbeon && \
    cp -R /usr/src/orbeon-2017.1.201706222342-CE/orbeon.war /usr/local/tomcat/webapps/orbeon/ && \
    cd /usr/local/tomcat/webapps/orbeon/ && \
    unzip -d . orbeon.war && \
    rm -rf orbeon.war && \
    rm -rf /usr/src/* && \

### Cleanup
    apk del \
        unzip \
        wget \
        && \

    rm -rf /var/cache/apk/*

### Add Files
ADD install /
