# @summary Manages the package of Gitlab runner
#
# @api private
#
class gitlab_ci_runner::install (
  $package_name     = $gitlab_ci_runner::package_name,
  $package_ensure   = $gitlab_ci_runner::package_ensure,
) {
  assert_private()

  if $facts['kernel'] == 'windows' {
    package { $package_name:
      ensure          => $package_ensure,
      install_options => ['--params', '/Service'],
      provider        => 'chocolatey',
    }
  }
  else {
    package { $package_name:
      ensure => $package_ensure,
    }
  }
}
