# @summmary
#   This class creates logwatch configuration files.
#
class logwatch::config (
  Hash[String,Hash[String,String]] $ignore = []
) inherits logwatch {

  file { 'logwatch.conf':
    ensure  => file,
    path    => '/etc/logwatch/conf/logwatch.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('logwatch/logwatch.conf.erb'),
  }

  concat { 'ignore.conf':
    path  => $logwatch::ignore_conf,
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat::fragment { 'header':
    target  => 'ignore.conf',
    content => "###### REGULAR EXPRESSIONS IN THIS FILE WILL BE TRIMMED FROM REPORT OUTPUT #####\n",
    order   => '01',
  }

  # pull ignores from hiera
  create_resources('logwatch::ignore', $ignore)
}
