module PowerClient
  module GeneratorHelper; end

  class Engine < ::Rails::Engine
    isolate_namespace PowerClient

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    initializer "initialize" do
      require_relative "./errors"
      require_relative "./generator_helper/client_helper"
      require_relative "./generator_helper/command_helper"
      require_relative "./generator_helper/job_helper"
      require_relative "./generator_helper/name_helper"
      require_relative "./generator_helper/parser_helper"
      require_relative "./generator_helper/rspec_helper"
      require_relative "./generator_helpers"
    end
  end
end
