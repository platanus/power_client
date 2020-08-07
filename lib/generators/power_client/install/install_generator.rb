class PowerClient::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  desc "This generator installs active_job_log gem and generates basic models needed"

  def install_active_job_log
    generate "active_job_log:install"
  end

  def copy_engine_migrations
    rake "railties:install:migrations"
  end

  def create_job_model
    create_file(helper.job_model_path, helper.job_model_tpl)
  end

  private

  def helper
    @helper ||= PowerClient::GeneratorHelpers.new
  end
end
