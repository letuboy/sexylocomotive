module Admin
  class PhotoGalleriesController < BaseController
    sections 'photo-galleries'

    respond_to :json, :on => :sort
		
    def index
      @photo_galleries = current_site.photo_galleries.where(:category_id => nil).order_by([[:title, :asc]])
      @categories = current_site.categories
    end
		
    def new
      @photo_gallery = current_site.photo_galleries.build
    end

    def sort
      @photo_gallery = PhotoGallery.find(params[:id])

      params[:children].each_index do |key|
        id = params[:children][key]

        @photo_gallery.photos.find(id).order = key
      end

      @photo_gallery.save

      render :json => {}
    end
  end
end
