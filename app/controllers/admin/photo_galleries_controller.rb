module Admin
  class PhotoGalleriesController < BaseController
    include ActionView::Helpers::SanitizeHelper
    include ActionView::Helpers::TextHelper
		
    sections 'photo-galleries'
		
    def index
      @photo_galleries = current_site.photo_galleries
    end
		
    def new
      @photo_gallery = current_site.photo_galleries.build
    end
  end
end
