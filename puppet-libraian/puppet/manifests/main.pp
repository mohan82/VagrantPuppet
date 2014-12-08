Exec{
  path =>["/usr/bin","/usr/sbin"]
}

#Call Apt Update Before Doing Anything
exec { "apt-update":
  path   =>"/usr/bin",
  command=>"apt-get update"
}


package { "install-git":
  name  =>"git",
  ensure=>installed,
}

package { "install-puppet-librarian":
  name    =>"librarian-puppet",
  provider=>"gem",
  ensure  =>" 1.0.2"

}

#Install Hiera
package { "install-heira":
  name    =>"hiera",
  provider =>"gem",
  ensure  =>installed,
}

package { "install-heira-puppet":
  name    =>"hiera-puppet",
  provider=>"gem",
  ensure  =>installed,

}

package { "install-vagrant-heira":
  name    =>"vagrant-hiera",
  provider =>"gem",
  ensure  =>installed,
}


Exec["apt-update"]->Package["install-git"]->Package["install-puppet-librarian"]
->Package["install-heira"]
->Package["install-heira-puppet"]->Package["install-vagrant-heira"]