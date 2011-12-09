module Admin
  class PhotosController < BaseController
    include ActionView::Helpers::SanitizeHelper
    extend ActionView::Helpers::SanitizeHelper::ClassMethods
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::NumberHelper

    before_filter :build_photo

    sections 'photo-galleries'

    def build_photo_gallery
      @photo_gallery = PhotoGallery.find(params[:photo_gallery_id])
    end

    def build_photo
      @photo_gallery = PhotoGallery.find(params[:photo_gallery_id])
      @photo = @photo_gallery.photos.build
    end

    def create
      @photo = @photo_gallery.photos.build(params[:photo])

      if @photo.save
        redirect_to admin_photo_gallery_url(@photo_gallery)
      end
    end

    def destroy
      @photo = @photo_gallery.photos.find(params[:id])
      @photo.destroy

      redirect_to admin_photo_gallery_url(@photo_gallery)
    end
  end
end