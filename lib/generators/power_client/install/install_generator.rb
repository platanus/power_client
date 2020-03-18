class PowerClient::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  desc "This generator installs active_job_log gem"

  def install_active_job_log
    generate "active_job_log:install"
  end
end
