# == Class: kibana3::apache
#
# Setup Apache vhost for kibana.
# It requires that puppetlabs/apache module is in use
#
# === Parameters
#
# [*config_dir*]
#    Location of the main configuration directory.
#    Default: operating system specific.
#
# [*elasticsearch_host*]
#    Specify which host to connect to.
#    Default: 127.0.0.1.
#
#  [*elasticsearch_port*]
#    Specify which port to connect to.
#    Default: 9200.
#
#  [*log_dir*]
#    Specify directory containing log files.
#    Default: undef
#
#  [*log_dir_apache*]
#    Specify apache directory containing log files.
#    Default: operating system specific.
#
#  [*server_name*]
#     Specify the name of the init script.
#     Default: operating system specific.
#
# === Authors
#
# Maxence Dunnewind <maxence@dunnewind.net>
#
# === Copyright
#
# Copyright 2013 Maxence Dunnewind
#
class kibana3::apache (
  $config_dir           = $::kibana3::params::config_dir,
  $elasticsearch_host   = $::kibana3::params::elasticsearch_host,
  $elasticsearch_port   = $::kibana3::params::elasticsearch_port,
  $log_dir              = $::kibana3::params::log_dir,
  $log_dir_apache       = $::kibana3::params::log_dir_apache,
  $server_name          = $::kibana3::params::server_name,
) {

  class {'apache': }

  apache::vhost { $server_name:
    docroot         => $config_dir,
    custom_fragment => template('kibana3/apache2.conf.erb')
  }
}
