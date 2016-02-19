class learning::quest_guide ($doc_root) {

  $content_repo_owner = 'puppetlabs'
  $content_repo_name  = 'puppet-quest-guide'
  $content_repo_dir   = "/usr/src/${content_repo_name}"

  class { 'learning::quest_guide_server':
    doc_root => $doc_root,
  }

  # Nodejs and npm are required for the GitBook quest guide setup
  class { '::nodejs':
    nodejs_dev_package_ensure => 'present',
    npm_package_ensure        => 'present',
    repo_class                => '::epel',
    require => Class['localrepo'],
  }

  # Install gitbook-cli
  package { 'gitbook-cli':
    ensure   => present,
    provider => 'npm',
    require  => Package['npm'],
  }

  # Grab the puppet-quest-guide repository so we can render it
  # as html with gitbook
  vcsrepo { $content_repo_dir:
    ensure   => present,
    provider => git,
    source   => "git://github.com/${content_repo_owner}/${content_repo_name}.git",
  }

  # This builds html from the quest guide repository
  exec { 'gitbook build':
    cwd     => $content_repo_dir,
    creates => "${content_repo_dir}/_book",
    require => [Vcsrepo[$content_repo_dir], Package['gitbook-cli']],
  }

  file { "${doc_root}/quest/":
    ensure  => symlink,
    target  => "${content_repo_dir}/_book",
    require => Exec['gitbook build'],
  }

}
