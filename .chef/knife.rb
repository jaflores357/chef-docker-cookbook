org_name = "demoltda"

username = ENV["ZENVIA_CHEF_USER"] || ENV["CHEF_USER"]

current_dir = File.expand_path(File.dirname(__FILE__))
chef_repo = File.expand_path(File.join(current_dir, ".."))

# Logging.
log_level :info
log_location STDOUT

# Chef server configuration.
chef_server_url "https://192.168.136.101/organizations/#{org_name}"
client_key "#{current_dir}/jorge_flores.pem"
node_name "#{username}"
ssl_verify_mode :verify_none

# Cache options
cache_type "BasicFile"
syntax_check_cache_path "#{current_dir}/syntaxcache"

# Chef repo path
chef_repo_path chef_repo
cookbook_path "#{chef_repo}/cookbooks"
data_bag_path "#{chef_repo}/data_bags"
environment_path "#{chef_repo}/environments"
node_path "#{chef_repo}/nodes"
role_path "#{chef_repo}/roles"
user_path "#{chef_repo}/users"

# Create cookbooks variables
cookbook_copyright "Jorge Flores"
cookbook_email "jorgef.flores@gmail.com"
