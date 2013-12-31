#
# Cookbook Name:: sensu-server-wrapper::check 
# Recipe:: default
#
# Copyright 2013, Ryutaro YOSHIBA 
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

template "/etc/sensu/conf.d/handler_default.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "handler_default.json.erb"
end

template "/etc/sensu/conf.d/check_cron.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "check_cron.json.erb"
end

template "/etc/sensu/conf.d/check-disk.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "check-disk.json.erb"
end

template "/etc/sensu/conf.d/load-metrics.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "load-metrics.json.erb"
end

service "sensu-server" do
  action :restart
end

# vim: filetype=ruby.chef
