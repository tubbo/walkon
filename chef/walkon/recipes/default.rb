#
# Cookbook Name:: walkon
# Recipe:: default
#
# Copyright (C) 2013 Tom Scott
# 
# All rights reserved - Do Not Redistribute
#

gem_package "install the latest gem codebase" do
  package_name 'walkon'
  action :install
end

cookbook_file "install the upstart job" do
  source "upstart.conf"
  path "/etc/init/walkon.conf"
  mode '0755'
  user 'root'
  group 'root'
  action :create
end

service "start the walkon process" do
  service_name 'walkon'
  action :restart
end
