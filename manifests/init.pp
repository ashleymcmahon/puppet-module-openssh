# == Class: ssh
#
# This class relates to openssh setup/configuration
# === Parameters
# No parameters needed
# === Variables
# No variables needed
# === Authors
# Ashley McMahon  <amcmahon@amadeus.com>

class ssh {

case $operatingsystem {
  suse: {Package{ provider => zypper }}
}

  package { ['openssh']:
    ensure  => 'installed'
  }
}
