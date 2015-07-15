# Class: npd6
class npd6 (
  $prefix,
  $interface      = 'eth0',
  $ralogging      = 'off',
  $listtype       = 'none',
  $addrlist       = [],
  $exprlist       = [],
  $listlogging    = 'off',
  $collecttargets = '100',
  $linkoption     = 'false',
  $ignorelocal    = 'true',
  $routerna       = 'true',
  $maxhops        = '255',
  $pollerrorlimit = '20',
) {

  package { 'npd6': ensure => 'installed' } ->
  file { '/etc/npd6.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/npd6.conf.erb"),
  } ~>
  service { 'npd6':
    ensure    => 'running',
    enable    => true,
    hasstatus => true,
  }

}

