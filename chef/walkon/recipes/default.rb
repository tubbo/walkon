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
end

service "start the walkon process" do
  provider Chef::Provider::Service::Upstart
  service_name 'walkon'
  action :restart
end

user "create a user for everyone to access the machine" do
  username "staff"
  group "staff"
  home "/home/staff"
end

directory "create a directory for music files to be dropped into" do
  path "/music"
  mode '0777'
  owner 'staff'
  group 'staff'
end

directory "create a directory for staff home dir" do
  path "/home/staff"
  user "staff"
  group "staff"
end

link "/home/staff/music" do
  to "/music"
end
