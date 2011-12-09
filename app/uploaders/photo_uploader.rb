
class PhotoUploader < CarrierWave::Uploader::Base
  include Locomotive::CarrierWave::Uploader::Asset

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    self.build_store_dir('site', model.photo_gallery.site_id, 'photo_galleries', model.photo_gallery.id, 'photos', model.id)
  end
end