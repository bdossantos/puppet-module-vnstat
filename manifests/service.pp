class vnstat::service {

    service {
        'vnstat':
        ensure      => 'running',
        enable      => true,
        hasstatus   => true,
        hasrestart  => true,
        require     => Class['vnstat::install'];
    }
}