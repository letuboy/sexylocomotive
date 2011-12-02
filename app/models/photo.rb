class Photo
  include Locomotive::Mongoid::Document

  ## extensions ##
  include Extensions::Asset::Types
  include Extensions::Asset::Vignette

  ## fields ##
  field :title, type: String
  field :desc, type: String
  field :content_type, :type => String
  field :width, type: Integer
  field :height, type: Integer
  field :size, type: Integer
  field :position, type: Integer, default: 0

  mount_uploader :source, AssetUploader

  embeds_in :photo_gallery
end
