Exec{
  path =>["/usr/bin","/usr/sbin"]
}

#Call Apt Update Before Doing Anything
exec {"apt-update":
  path =>"/usr/bin",
  command=>"apt-get update"
}


package {"install-git":
  name=>"git",
  ensure=>installed,
}

package {"install-puppet-librarian":
  name=>"librarian-puppet",
  provider=>"gem",
  ensure=>" 1.0.2"

}

Exec["apt-update"]->Package["install-git"]->Package["install-puppet-librarian"]