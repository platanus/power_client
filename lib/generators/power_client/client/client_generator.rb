class PowerClient::ClientGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  class_option(
    :specs,
    type: 'boolean',
    aliases: '-s',
    default: true,
    desc: 'to indicate if RSpec files should be created'
  )

  class_option(
    :parser,
    type: 'boolean',
    aliases: '-p',
    default: true,
    desc: 'to indicate if related parser should be created'
  )

  class_option(
    :job,
    type: 'boolean',
    aliases: '-j',
    default: true,
    desc: 'to indicate if related job should be created'
  )

  def create_client
    create_file(helper.client_path, helper.client_tpl)
  end

  def create_parser
    return unless helper.add_parser

    create_file(helper.parser_path, helper.parser_tpl)
  end

  def create_parser_spec
    return unless helper.add_specs && helper.add_parser

    create_file(helper.parser_spec_path, helper.parser_spec_tpl)
  end

  def create_job
    return unless helper.add_job

    create_file(helper.job_path, helper.job_tpl)
  end

  def create_job_spec
    return unless helper.add_specs && helper.add_job

    create_file(helper.job_spec_path, helper.job_spec_tpl)
  end

  private

  def helper
    @helper ||= PowerClient::GeneratorHelpers.new(
      client_name: file_name,
      add_specs: options[:specs],
      add_parser: options[:parser],
      add_job: options[:job],
    )
  end
end
