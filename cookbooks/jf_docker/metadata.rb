name "jf_docker"
maintainer "Jorge Flores"
maintainer_email "jorgef.flores@gmail.com"
license "All rights reserved"
description "Install/Configure Docker, Docker Compose"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version "0.1.1"

supports "centos", ">= 7.1"

depends "docker", "~> 2.0"
