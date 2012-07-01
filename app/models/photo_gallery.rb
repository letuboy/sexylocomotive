# To change this template, choose Tools | Templates
# and open the template in the editor.

class PhotoGallery	
  include Locomotive::Mongoid::Document
	
  # -- fields --

  field :title, type: String
  field :slug, type: String
	
  # -- references --

  referenced_in :site

  belongs_to :category
  
  embeds_many :photos

  def sorted_photos
    photos.sort { |photo1, photo2| photo1.order <=> photo2.order }
  end

  def random_photos(n)
    random_indexes = []
    photo_count = photos.count

    n.times do
      random_indexes << rand((photo_count - 1))
    end

    photos.to_a.values_at(*random_indexes)
  end

  def to_liquid
    Locomotive::Liquid::Drops::PhotoGallery.new(self)
  end
end
