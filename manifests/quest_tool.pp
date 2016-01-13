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

  file { "${home}/bin":
    ensure => directory,
  }
  
  file { "${home}/bin/quest":
    ensure => file,
    source => 'puppet:///modules/learning/quest',
  }

  file { "$[home]/.testing":
    ensure => directory,
  }

  file { "${home}/.testing/test.rb":
    ensure => filem
    source => 'puppet:///modules/learning/test.rb',
  }

  file { "${home}/.tmux.conf":
    ensure => file,
    source => 'puppet:///modules/learning/tmux.conf',
  }

}
