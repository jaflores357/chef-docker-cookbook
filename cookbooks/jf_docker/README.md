jf_docker Docker Cookbook
======================

Description
-----------

[Docker](https://www.docker.com) is an open-source project that automates
the deployment of applications inside software containers, by providing
an additional layer of abstraction and automation of operating-system-level
virtualisation on Linux.
Docker uses the resource isolation features of the Linux kernel such as cgroups
and kernel namespaces, and a union-capable file system such as aufs and others
to allow independent "containers" to run within a single Linux instance,
avoiding the overhead of starting and maintaining virtual machines.

This cookbook provides recipes to install and configure Docker with
configuration stored in attributes. It wraps [docker cookbook][] resources to
control Docker status and also provides resources to manager swarm cluster
creation and volumes deployment.



Requirements
------------

### Cookbooks and gems

Declared in [metadata.rb](metadata.rb) and in [Gemfile](Gemfile).

### Platforms

- RHEL / CentOS Family 7



Usage
-----

### Test

This cookbook is fully tested in test-kitchen, using the vagrant driver and
serverspec verifier.



Attributes
----------

Configuration is done by overriding default attributes. All configuration keys
have a default defined in [attributes/default.rb](attributes/default.rb).
Please read it to have a comprehensive view of what and how you can configure
this cookbook behavior.

In addition, you can use attributes to define [docker cookbook][] resources.
All you have to do is to define an attribute of the same name as the resource
you want to call containing the different instances of this resource.



Recipes
-------

### default

Include `repository`, `package`, `service` and `docker` recipes.

### repository

Configure and install official docker yum repository.



### package

Install `Docker CE` package or upgrade it if attribute version is set to
`latest`.



### service

Enable and start `docker` service. Restart it if systemd config was updated.



### docker

Wrap all [docker cookbook][] resources so it is possible to use them with
attributes. Read [attributes](#attributes) section for more details.



Resources/Providers
-------------------



Changelog
---------

Available in [CHANGELOG.md](CHANGELOG.md).



Contributing
------------

Please read carefully [CONTRIBUTING.md](CONTRIBUTING.md) before making a merge
request.



License and Author
------------------

- Author:: Jorge Flores (<jorgef.flores@gmail.com>)


```text
Copyright (c) 2017 Jorge Flores
```

[docker]: https://docker.com
[docker cookbook]: https://supermarket.chef.io/cookbooks/docker
