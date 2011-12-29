/*
 * TODO:
 * - Logging options (path, file, syslog ...)
 * - Daemon config
 */
class vnstat($database_dir = '/home/vnstat', $interface = "eth0") {
	
	package { 
		'vnstat':
        ensure => 'installed'
    }
	
	file {
        $database_dir:
		ensure => 'directory',
        mode => 0700,
        owner  => 'root',
		group  => 'root';
		
		'/etc/vnstat.conf':
		ensure => 'file',
		mode => 0644,
		content => template('vnstat/etc/vnstat.conf.erb'),
        owner  => 'root',
		group  => 'root',
		before => Package['vnstat'],
		notify => Service['vnstat'],
	}
	
	service {
		'vnstat':
        ensure => 'running',
		enable => true,
        hasstatus => true,
        hasrestart => true,
	}
	
	exec { 
		new-database:
	  	command => "/usr/bin/vnstat -u -i ${interface}",
	  	creates => "${$database_dir}/${$interface}",
		require => [Package['vnstat'], File[$database_dir]],
		notify => Service['vnstat'],
	}
}