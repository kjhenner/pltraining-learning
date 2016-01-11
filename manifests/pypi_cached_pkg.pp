define learning::pypi_cached_pkg {

  include wget

  $basename = inline_template('<%= File.basename($name) %>')
  wget::fetch { $name:
    destination => "${pypi_pkg_dir}/${basename}",
  }

}
