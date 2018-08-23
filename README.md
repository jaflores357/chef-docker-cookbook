Install Vagrant and VirtualBox
------------------------------

- Install packages (on your host)

https://www.vagrantup.com/downloads.html

https://www.virtualbox.org/

Up vagrant file
---------------

- Up vagrant file (on your host)

  > vagrant up


Install Docker on chef-server
-----------------------------
- Conect on chef-server (on your host)
  
  > vagrant ssh chef-server 

- Install docker package (on virtual host chef-server)

  > curl https://download.docker.com/linux/centos/docker-ce.repo > /etc/yum.repos.d/docker-ce.repo
  > sudo yum install docker-ce

- Start docker service (on virtual host chef-server)

  > sudo systemctl start docker.service


Install Docker Compose on CentOS
--------------------------------

- Install docker-compose tool (on virtual host chef-server)

  > sudo yum install -y epel-release
  > sudo yum -y install python-pip
  > sudo pip install --upgrade pip
  > sudo pip install docker-compose
  

Run docker compose
------------------

- Up docker-compose file deamon mode (on virtual host chef-server)

  > cd /vagrant
  > sudo docker-compose -f chef-compose.yml up -d


Setup Chef Server
-----------------

- Setup chef user as admin (on virtual host chef-server)

  > docker exec -ti root_chef-server_1 chef-server-ctl user-create jorge_flores Jorge Flores jorgef.flores@gmail.com NmNmMTI0OTYw

  * save the key  

  > docker exec -ti root_chef-server_1 chef-server-ctl org-create demoltda Demo
  > docker exec -ti root_chef-server_1 chef-server-ctl org-user-add demoltda jorge_flores  --admin
  

Setup chef connection 
---------------------

- Setup knife.rb (on your host)

  folder chef-repo, edit the file .chef/knife.rb and setup your user name, org name, etc
  
  copy the user key to .chef/ with the name describe in client_key attribute on knife.rb file


Upload environment, role and cookbook
-------------------------------------

- Using knife command (on your host)

  > knife upload roles/prd-app.json
  > knife upload environment/prdo.json
  
  
- Upload cookbook using berkshelf (on your host)

  > cd cookbooks/jf_docker
  > berks 
  > berks upload
  
  
Bootstrap app01
---------------

- Bootstrap your host (on your host)

  > knife bootstrap -E "prod" --sudo -x vagrant -i ../.vagrant/machines/app01/virtualbox/private_key -N app01 192.168.136.111 --node-ssl-verify-mode none -r 'role[prd-app]'

Run chef client on app01
------------------------

- Using knife ssh (on your host)

  > knife ssh 'name:app01' -a ipaddress 'sudo chef-client'


