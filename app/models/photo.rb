class Photo
  include Locomotive::Mongoid::Document

  ## extensions ##
  include Extensions::Asset::Types

  ## fields ##
  field :title, type: String
  field :desc, type: String
  field :local_path
  field :content_type
  field :width, :type => Integer
  field :height, :type => Integer
  field :size, :type => Integer
  field :folder, :default => nil

  field :order, :type => Integer, :default => 0

  mount_uploader :source, PhotoUploader

  embedded_in :photo_gallery

  def to_liquid
    puts "Converted photo to liquid.."

    Locomotive::Liquid::Drops::Photo.new(self)
  end

end
