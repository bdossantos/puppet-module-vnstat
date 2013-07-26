# Puppet Vnstat Module

[![Build Status](https://travis-ci.org/bdossantos/puppet-module-vnstat.png)](https://travis-ci.org/bdossantos/puppet-module-vnstat)

Module for configuring Vnstat

Tested on Debian GNU/Linux 6.0 Squeeze with Puppet 2.6 and 2.7. Patches for other operating systems welcome.

## Usage

```puppet
node default {
  class { 'vnstat':
    database_dir  => '/var/lib/vnstat',
    interface     => 'eth0',
  }
}
```

## Running the tests

Install the dependencies using [Bundler](http://gembundler.com):

```bash
bundle install
```

Run the following command :

```bash
bundle exec rake spec
