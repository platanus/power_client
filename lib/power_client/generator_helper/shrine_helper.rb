module PowerClient::GeneratorHelper::ShrineHelper
  extend ActiveSupport::Concern

  def uploader_path
    'app/uploaders/image_uploader.rb'
  end

  def uploader_tpl
    <<~UPLOADER
      class ImageUploader < Shrine
      end
    UPLOADER
  end
end
