class learning {

  class { 'learning::quest_guide':
    doc_root => '/var/www/html',
  }

  ## Install learning VM specific things
  include learning::install
  include learning::quest_tool
  include learning::ssh
  include learning::set_defaults

}
