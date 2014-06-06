Docker-Java8
============

## Summary

Repository name in Docker Index: **[williamyeh/docker-java8](https://index.docker.io/u/williamyeh/docker-java8/)**

This repository contains **Dockerfile** of [Java](https://www.java.com/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/williamyeh/docker-java8/) published to the public [Docker Registry](https://index.docker.io/).





## Configuration

This docker image contains the following software stack:

- OS: Debian jessie (built from [debian:jessie](https://index.docker.io/_/debian/)).

- Java: Oracle JDK 1.8.0_05-b13


### Dependencies

- [debian:jessie](https://index.docker.io/_/debian/).



## Why yet another Java image for Docker?

There has been quite a few Java images for Docker (e.g., [search](https://index.docker.io/search?q=java) in the Docker Index), so why reinvent the wheel?

In the beginning I used the [pulse00/java](https://github.com/dubture-dockerfiles/java). It worked well, but left some room for improvement:

- *Base OS image* - It was built from [stackbrew/ubuntu:13.10](https://index.docker.io/u/stackbrew/ubuntu/), which may not be the smallest one.  On the other hand, [debian:jessie](https://index.docker.io/_/debian/), as recommended in this [article](http://crosbymichael.com/dockerfile-best-practices-take-2.html), worth a try.

- *Unnecessary dependencies* - It installed, at the very beginning of its Dockerfile, the [software-properties-common](https://packages.debian.org/sid/admin/software-properties-common) package, which in turns installed some Python3 packages.  I prefered to incorporate these stuff only when absolutely needed.

Therefore, I built this Docker image on my own, also as an exercise.



## Installation on Docker-friendly OS

If you're using a Docker-friendly OS (e.g., CoreOS, Debian, Ubuntu):

1. Install [Docker](https://www.docker.io/), if necessary.

2. Download this [trusted build](https://index.docker.io/u/williamyeh/docker-java8/) from public [Docker Registry](https://index.docker.io/):

   ```
   $ docker pull williamyeh/docker-java8
   ```

   (alternatively, you can build an image from Dockerfile: `docker build -t="williamyeh/docker-java8" github.com/William-Yeh/docker-java8`)



## Installation on Vagrant


### For the impatient

1. Copy the `Vagrantfile` of this project to your working directory.

2. Initialize and ssh into the Vagrant box:

   ```
   $ vagrant up
   $ vagrant ssh
   ```




### "Docker" provider

If you'd like to use the [Docker provider feature](https://www.vagrantup.com/blog/feature-preview-vagrant-1-6-docker-dev-environments.html) introduced since Vagrant 1.6:

1. Place a `Vagrantfile` in your working directory like this:

   ```
   VAGRANTFILE_API_VERSION = "2"
   DOCKER_IMAGE = "williamyeh/docker-java8"

   Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
       config.vm.define #{DOCKER_IMAGE} do |v|
           v.vm.provider "docker" do |d|
               d.image = #{DOCKER_IMAGE}
           end
       end
   end
   ```


2. Initialize the Docker container (with an implicit Vagrant box such as [mitchellh/boot2docker](https://github.com/mitchellh/boot2docker-vagrant-box), if necessary):

   ```
   $ vagrant up --provider=docker
   ``` 

3. See if Docker runs successfully:

   ```
   $ vagrant docker-logs
   ```


Vagrant 1.6 has also introduced Docker-related commands (e.g., `docker-logs` & `docker-run`). Consult the [official document](https://docs.vagrantup.com/v2/docker/commands.html) for more details.






## Usage


### Dig into container

```
$ docker run -it williamyeh/docker-java8 bash
```

#### Run `java`

```
$ docker run --rm -it williamyeh/docker-java8
```


#### Run `javac`

```
$ docker run --rm -it williamyeh/docker-java8 javac
```
