#
# Cookbook Name:: sensu-server-wrapper 
# Recipe:: default
#
# Copyright 2013, Ryutaro YOSHIBA 
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

if node["sensu-server-wrapper"]["iptables_enabled"]
  include_recipe "iptables"
  iptables_rule "http_8080"
  iptables_rule "rabbitmq"
  iptables_rule "ssh"
end

include_recipe "yum-epel"

package "erlang" do
  action :install
  options "--enablerepo=epel"
end

include_recipe "sensu::default"
include_recipe "sensu::rabbitmq"
include_recipe "sensu::redis"
include_recipe "sensu::api_service"
include_recipe "sensu::dashboard_service"
include_recipe "sensu::server_service"

# vim: filetype=ruby.chef
