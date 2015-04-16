#
# Cookbook Name:: sensu-server-wrapper 
# Recipe:: default
#
# Copyright 2013, Ryutaro YOSHIBA 
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

case node["platform"]
when "centos", "redhat", "amazon", "scientific", "fedora"
  include_recipe "ca-certificates::default"
end

if node["sensu-server-wrapper"]["iptables_enabled"]
  include_recipe "iptables"
  iptables_rule "iptables_rabbitmq"
  iptables_rule "iptables_sensu_api"
  iptables_rule "iptables_ssh"
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
include_recipe "sensu::server_service"

# vim: filetype=ruby.chef
