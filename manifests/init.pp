class vnstat($database_dir = '/home/vnstat', $interface = 'eth0') {

    include vnstat::install,
            vnstat::service
}