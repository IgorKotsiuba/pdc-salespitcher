class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  process resize_to_fit: [800, 800]

  version :thumb, if: :image? do
    process resize_to_fill: [200, 200]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png pdf doc docx)
  end

  protected

  def image?(new_file)
    new_file.content_type.start_with? 'image'
  end
end
