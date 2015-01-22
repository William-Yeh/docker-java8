Docker-Java8
============

## Summary

Repository name in Docker Hub: **[williamyeh/java8](https://registry.hub.docker.com/u/williamyeh/java8/)**

This repository contains Dockerized [Java](https://www.java.com/) 1.8, published to the public [Docker Hub](https://registry.hub.docker.com/) via **automated build** mechanism.



## Configuration

This docker image contains the following software stack:

- OS: Debian jessie (built from [debian:jessie](https://registry.hub.docker.com/_/debian/)).

- Java: Oracle JDK 1.8.0_31-b13


### Dependencies

- [debian:jessie](https://registry.hub.docker.com/_/debian/).



## Why yet another Java image for Docker?

There has been quite a few Java images for Docker (e.g., [search](https://registry.hub.docker.com/search?q=java) in the Docker Hub), so why reinvent the wheel?

In the beginning I used the [pulse00/java](https://github.com/dubture-dockerfiles/java). It worked well, but left some room for improvement:

- *Base OS image* - It was built from [stackbrew/ubuntu:13.10](https://registry.hub.docker.com/u/stackbrew/ubuntu/), which may not be the smallest one.  On the other hand, [debian:jessie](https://registry.hub.docker.com/_/debian/), as recommended in this [article](http://crosbymichael.com/dockerfile-best-practices-take-2.html), worth a try.

- *Unnecessary dependencies* - It installed, at the very beginning of its Dockerfile, the [software-properties-common](https://packages.debian.org/sid/admin/software-properties-common) package, which in turns installed some Python3 packages.  I prefered to incorporate these stuff only when absolutely needed.

Therefore, I built this Docker image on my own, also as an exercise.


## Alternatives

- [errordeveloper/oracle-jdk](https://registry.hub.docker.com/u/errordeveloper/oracle-jdk/), if you prefer a minimalistic Oracle JDK 8 container on top of busybox.

- [java](https://registry.hub.docker.com/_/java/) or [azul/zulu-openjdk](https://registry.hub.docker.com/u/azul/zulu-openjdk/), if you prefer OpenJDK.

## Installation

   ```
   $ docker pull williamyeh/java8
   ```


## Usage

Used mostly as a base image for other Java-based applications. But if you'd like to use the CLI, here are some examples for you.


#### Run `java`

```
$ docker run --rm williamyeh/java8
```


#### Run `javac`

```
$ docker run -it --rm williamyeh/java8 javac
```


### Dig into container

```
$ docker run -it williamyeh/java8 bash
```

