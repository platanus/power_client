module PowerClient
  class GeneratorHelpers
    include GeneratorHelper::ClientHelper
    include GeneratorHelper::JobHelper
    include GeneratorHelper::JobModelHelper
    include GeneratorHelper::NameHelper
    include GeneratorHelper::ParserHelper
    include GeneratorHelper::RSpecHelper
    include GeneratorHelper::ShrineHelper

    def initialize(config = {})
      config.each do |attribute, value|
        load_attribute(attribute, value)
      end
    end

    private

    def load_attribute(attribute, value)
      send("#{attribute}=", value)
    end
  end
end
