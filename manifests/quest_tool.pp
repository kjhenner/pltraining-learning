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

  file { "${home}/.bashrc.learningvm":
    ensure => file,
    source => 'puppet:///modules/learning/bashrc.learningvm',
  }

  package { 'quest':
    provider => gem,
    source   => 'http://rubygems.delivery.puppetlabs.net/',
  }

}
