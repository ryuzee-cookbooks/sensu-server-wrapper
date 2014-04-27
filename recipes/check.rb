#
# Cookbook Name:: sensu-server-wrapper::check 
# Recipe:: default
#
# Copyright 2013, Ryutaro YOSHIBA 
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

template "/etc/sensu/conf.d/handler-default.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "handler-default.json.erb"
end

template "/etc/sensu/conf.d/check-cron.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "check-cron.json.erb"
end

template "/etc/sensu/conf.d/check-disk.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "check-disk.json.erb"
end

template "/etc/sensu/conf.d/check-cpu.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "check-cpu.json.erb"
end

template "/etc/sensu/conf.d/check-ram.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "check-ram.json.erb"
end

template "/etc/sensu/conf.d/load-metrics.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "load-metrics.json.erb"
end

template "/etc/sensu/conf.d/vmstat-metrics.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "vmstat-metrics.json.erb"
end

template "/etc/sensu/conf.d/disk-usage-metrics.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "disk-usage-metrics.json.erb"
end

remote_file "/etc/sensu/plugins/graphite.rb" do
  source "https://github.com/sensu/sensu-community-plugins/raw/master/mutators/graphite.rb"
end

template "/etc/sensu/conf.d/handler-graphite.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "handler-graphite.json.erb"
end

template "/etc/sensu/conf.d/mutator-graphite.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "mutator-graphite.json.erb"
end

service "sensu-server" do
  action :restart
end

service "sensu-api" do
  action :restart
end

# vim: filetype=ruby.chef
