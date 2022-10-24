# @summary Manages the service of Gitlab runner
#
# @api private
#
class gitlab_ci_runner::service (
  $package_name = $gitlab_ci_runner::package_name,
) {
  assert_private()

  if $facts['osfamily'] == 'windows' {
    $service_enable = 'delayed'
  }
  else {
    $service_enable = true
  }

  service { $package_name:
    ensure => running,
    enable => $service_enable,
  }
}
