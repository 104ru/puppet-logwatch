# @summary
#   This class configures Logwatch
#
# @param output
#   By default Logwatch will print to stdout in text with no encoding.
#   To make email Default set Output = mail to save to file set Output = file
#
# @param format
#   To make Html the default formatting Format = html
#
# @param mail_to
#   Default person to mail reports to.  Can be a local account or a
#   complete email address.  Variable Output should be set to mail, or
#   --output mail should be passed on command line to enable mail feature.
#
# @param mail_from
#   Default person to mail reports from.  Can be a local account or a
#   complete email address.
#
# @param range
#   The default time range for the report...
#   The current choices are All, Today, Yesterday
#
# @param detail
#   The default detail level for the report.
#   This can either be Low, Med, High or a number.
#
# @param service
#   The 'Service' option expects either the name of a filter
#   (in /usr/share/logwatch/scripts/services) or 'All'.
#   The default service(s) to report on.  This should be left as All for
#   most people.
#
# @param package_ensure
#   Logwatch gets installed when it is When `present` and removed if `absent`.
#
# @param package_name
#   The name of the logwatch package.
#
# @ignore
#   An array of ignore regex statements
#
# @option ignore [String] :name
#   Name of the ignore policy.
#
# @option ignore [Hash] :regex
#   Value is a regular expression to match dropped records.
#
#
class logwatch (
  String $output = $logwatch::params::output,
  String $format = $logwatch::params::format,
  Array[String] $mail_to = $logwatch::params::mail_to,
  String $mail_from = $logwatch::params::mail_from,
  Enum['All','Today','Yesterday'] $range = $logwatch::params::range,
  Enum['Low','Med','High'] $detail = $logwatch::params::detail,
  Array[String] $service = $logwatch::params::service,
  Enum['absent','present'] $package_ensure = $logwatch::params::package_ensure,
  String $package_name   = $logwatch::params::package_name,
  Stdlib::Absolutepath $ignore_conf = $logwatch::params::ignore_conf,
  Hash[String,Hash[String,String]] $ignore = {}
) inherits logwatch::params {

  anchor { 'logwatch::begin': }
  -> class { '::logwatch::install': }
  -> class { '::logwatch::config': ignore => $ignore }
  -> anchor { 'logwatch::end': }

}
