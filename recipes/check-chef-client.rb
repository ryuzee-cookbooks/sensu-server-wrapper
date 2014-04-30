#
# Cookbook Name:: sensu-server-wrapper::check-chef-client
# Recipe:: default
#
# Copyright 2013, Ryutaro YOSHIBA 
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

template "/etc/sensu/conf.d/check-chef-client.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "check-chef-client.json.erb"
  notifies :restart, "service[sensu-server]", :delayed
  notifies :restart, "service[sensu-api]", :delayed
end

# vim: filetype=ruby.chef
