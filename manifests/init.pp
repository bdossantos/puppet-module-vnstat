class vnstat($database_dir = '/var/lib/vnstat', $interface = 'eth0') {

  include vnstat::install,
          vnstat::service
}
