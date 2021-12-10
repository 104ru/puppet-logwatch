# @summary
#   This class installs logwatch packages.
#
class logwatch::install inherits logwatch {

  package { 'logwatch':
    ensure => $logwatch::package_ensure,
    name   => $logwatch::package_name,
  }

}
