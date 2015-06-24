# == Class: openssh
#
# This class relates to openssh setup/configuration
#
# === Parameters
#
# No parameters needed
#
# === Variables
#
# No variables needed
#
# === Authors
#
# Ashley McMahon  <amcmahon@amadeus.com>
#
class ssh {

  package { ['openssh']:
    ensure  => 'installed'
  }

  service { ['sshd']:
    ensure  => 'running',
    enable  => true,
    require => [Package['openssh']]
  }
	
  file { '/etc/ssh/sshd_config':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    source => "puppet:///modules/${module_name}/sshd_config",
    notify => Service['sshd']
  }

}

