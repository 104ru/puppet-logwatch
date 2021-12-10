# @summary
#   Class adding entries to ignore.conf
#
# @param regex
#   Regular expression defining log entries to ignore.
#
define logwatch::ignore (
  $regex,
) {
  concat::fragment { $title:
    target  => 'ignore.conf',
    content => "${regex}\n",
    order   => '05',
  }
}
