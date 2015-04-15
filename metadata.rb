name             'sensu-server-wrapper'
maintainer       'Ryutaro YOSHIBA'
maintainer_email 'ryuzee@gmail.com'
license          'MIT'
description      'Installs/Configures sensu-server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.1'
depends          'ca-certificates'
depends          'iptables'
depends          'yum'
depends          'yum-epel'
depends          'sensu', "~> 2.2"
depends          'apache2-simple'
depends          "redisio", "~> 1.7"
