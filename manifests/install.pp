class vnstat::install {

  package { 'vnstat':
    ensure => 'installed'
  }

  file { $vnstat::database_dir:
    ensure  => 'directory',
    mode    => '0700',
    owner   => 'root',
    group   => 'root';
  }

  file { '/etc/vnstat.conf':
    ensure  => 'file',
    mode    => '0644',
    content => template('vnstat/etc/vnstat.conf.erb'),
    owner   => 'root',
    group   => 'root',
    before  => Package['vnstat'],
    notify  => Service['vnstat'];
  }

  exec { 'new-database':
    command => "/usr/bin/vnstat -u -i ${vnstat::interface}",
    creates => "${vnstat::database_dir}/${vnstat::interface}",
    require => [Package['vnstat'], File[$vnstat::database_dir]],
    notify  => Service['vnstat'];
  }
}