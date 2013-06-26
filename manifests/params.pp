# == Class kibana3::params
#
class kibana3::params {
  $elasticsearch_host  = '127.0.0.1'
  $elasticsearch_port  = '9200'
  $elasticsearch_index = 'kibana-int'

  case $::operatingsystem {
    'RedHat': {
      $config_dir         = '/usr/share/kibana3'
      $config_dir_mode    = '0755'
      $config_dir_recurse = false
      $config_file        = '/usr/share/kibana3/config.js'
      $config_group       = 'root'
      $config_mode        = '0644'
      $config_purge       = false
      $config_user        = 'root'
      $daemon_group       = 'apache'
      $daemon_user        = 'apache'
      $log_dir            = '/var/log/httpd/kibana3'
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = 'kibana3'
      $service_name       = 'httpd'
    }

    'Debian': {
      $config_dir         = '/usr/share/kibana3'
      $config_dir_mode    = '0755'
      $config_dir_recurse = false
      $config_file        = '/usr/share/kibana3/config.js'
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_user        = 'root'
      $daemon_group       = 'www-data'
      $daemon_user        = 'www-data'
      $log_dir            = '/var/log/apache2/kibana3'
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = 'kibana3'
      $service_name       = 'apache2'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}

