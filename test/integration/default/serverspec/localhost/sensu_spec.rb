require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
  end
  c.path = "/sbin:/usr/sbin"
end

%w{rabbitmq-server sensu}.each do |p|
  describe package(p) do
    it { should be_installed }
  end
end

%w{rabbitmq-server sensu-server sensu-api}.each do |p|
  describe service(p) do
    it { should be_enabled }
    it { should be_running }
  end
end

%w[5672 6379 9000 8080].each do |port|
  describe port(port) do
    it { should be_listening }
  end
end

