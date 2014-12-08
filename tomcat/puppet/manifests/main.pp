Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
File {
  ensure => "present",
  owner  => "vagrant",
  group  => "vagrant",
}


class {
  'jdk_oracle':
    version  =>"6",
    use_cache=>true
}
