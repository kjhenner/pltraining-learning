class learning::quest_tool {

  $home = '/root'

  package { 'tmux':
    ensure  => 'present',
  }

  File {
    owner => 'root',
    group => 'root',
    mode  => '0744',
  }

  file { "${home}/.tmux.conf":
    ensure => file,
    source => 'puppet:///modules/learning/tmux.conf',
  }

  package { 'quest':
    provider => gem,
    gemcmd   => '/bin/gem'
    source   => 'http://rubygems.delivery.puppetlabs.net/',
  }

}
