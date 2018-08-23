Install Docker on CentOS
------------------------

curl https://download.docker.com/linux/centos/docker-ce.repo > /etc/yum.repos.d/docker-ce.repo
yum install docker-ce
systemctl start docker.service


Install Docker Compose on CentOS
--------------------------------

yum install -y epel-release
yum -y install python-pip
pip install --upgrade pip
pip install docker-compose


Run docker compose
------------------

docker-compose -f chef-compose.yml up -d
getenforce
vi /etc/sysconfig/selinux
setenforce 0


Setup Chef Server
-----------------

docker exec -ti root_chef-server_1 chef-server-ctl user-create jorge_flores Jorge Flores jorgef.flores@gmail.com NmNmMTI0OTYw
docker exec -ti root_chef-server_1 chef-server-ctl org-create demoltda Demo
docker exec -ti root_chef-server_1 chef-server-ctl org-user-add demoltda jorge_flores  --admin



Bootstrap host
--------------

knife bootstrap -E "prod" --sudo -x vagrant -i ../.vagrant/machines/app01/virtualbox/private_key -N app01 192.168.136.111 --node-ssl-verify-mode none -r 'role[prd-app]'


