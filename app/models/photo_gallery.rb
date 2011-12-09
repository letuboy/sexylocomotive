# To change this template, choose Tools | Templates
# and open the template in the editor.

class PhotoGallery	
  include Locomotive::Mongoid::Document
	
  # -- fields --

  field :title, type: String
  field :slug, type: String
	
  # -- references --

  referenced_in :site
  
  embeds_many :photos

  def sorted_photos
    photos.sort { |photo1, photo2| photo1.order <=> photo2.order }
  end
end
