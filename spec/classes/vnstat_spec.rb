require 'spec_helper'

describe 'vnstat', :type => :class do
  let(:title) { 'vnstat' }
  let(:params) do {
      :database_dir => '/var/lib/vnstat',
      :interface    => 'eth0',
    }
  end

  it do
    should contain_file('/var/lib/vnstat').with({
      'ensure'  => 'directory',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0700',
    })
  end

  it do
    should contain_file('/etc/vnstat.conf').with({
      'ensure'  => 'file',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
    })
  end

  it do
    should contain_exec('new-database').with({
      'command' => '/usr/bin/vnstat -u -i eth0',
      'creates' => '/var/lib/vnstat/eth0',
    })
  end
end
