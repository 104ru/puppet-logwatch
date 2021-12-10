# @api private
#
# @summary
#   Private class providing default parameters for others.
#
class logwatch::params {

  $output         = $::osfamily ? {
    'RedHat' => 'unformatted',
    default  => 'stdout',
  }
  $format         = $::osfamily ? {
    'RedHat' => 'text',
    default  => 'test',
  }
  $mail_to        = [ 'root' ]
  $mail_from      = 'Logwatch'
  $range          = 'Yesterday'
  $detail         = 'Low'
  $service        = [ 'All' ]
  $package_ensure = 'present'
  $package_name   = 'logwatch'
  $ignore_conf    = '/etc/logwatch/conf/ignore.conf'

}
