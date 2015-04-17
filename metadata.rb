name             'sensu-server-wrapper'
maintainer       'Ryutaro YOSHIBA'
maintainer_email 'ryuzee@gmail.com'
license          'MIT'
description      'Installs/Configures sensu-server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.2'
depends          'ca-certificates'
depends          'iptables'
depends          'yum', ">= 3.5.0"
depends          'yum-epel'
depends          'sensu', ">= 2.2.0"
depends          "redisio", "~> 1.7"
