# Oracle Java 8 for Debian jessie
#
# URL: https://github.com/William-Yeh/docker-java8
#
# Reference:  http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html
#
# Version     0.1
#

# pull base image
FROM debian:jessie


# add webupd8 repository
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update


# install Java
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install -y --force-yes oracle-java8-installer


# update-alternatives --config java
RUN apt-get install oracle-java8-set-default


# clean up
RUN apt-get clean


# define default command
CMD ["java"]
