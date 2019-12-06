#
# Cookbook:: install_apache
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'Install Apache and Tools' do 
  case node[:platform]
  when 'redhat', 'centos'
    package_name %w(httpd wget curl zip unzip bash-completion)
  when 'ubuntu', 'debian'
    package_name %w(apache2 wget curl zip unzip)
  end
end

#package "httpd" do
#    action :install
#  end

service "httpd" do
    action [:enable, :start]
  end

#cookbook_file "/var/www/html/index.html" do
#    source "index.html"
#    mode 0644
#  end

template "/var/www/html/index.html" do
    source "index.html.erb"
    mode 0644
  end

execute 'http_firewall' do
    command '/usr/bin/firewall-cmd --permanent --zone public --add-service http' 
    ignore_failure true
  end

execute 'reload_firewall' do 
  command '/usr/bin/firewall-cmd --reload'
  ignore_failure true 
end

group "sasi" do 
  gid 9999
end

user 'sasic' do 
  comment 'Admin at my lab at home'
  uid '9999'
  gid '9999'
  manage_home true 
  home '/home/sasic'
  shell '/bin/bash'
  password 'mypassw0rd'
end


  
