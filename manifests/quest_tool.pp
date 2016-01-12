class learning::quest_tool {

  $home = '/root'

  package { 'tmux':
    ensure  => 'present',
    require => Class['localrepo'],
  }

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { "${home}/bin":
    ensure => 'directory',
  }
  
  file { "${home}/bin/quest":
    ensure => file,
    source => 'puppet:///modules/learning/quest',
  }

  file { "${home}/.tmux.conf":
    ensure => file,
    source => 'puppet:///modules/learning/tmux.conf',
  }

}
