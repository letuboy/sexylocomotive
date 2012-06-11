module Admin
  class CategoriesController < BaseController
    sections "photo-galleries"

    def new
      @category = current_site.categories.build
    end

    def create
      @category = current_site.categories.build params[:category]

      if @category.save
        redirect_to admin_photo_galleries_path
      else
        render 'new'
      end
    end

    def show
      @category = Category.find params[:id]
      @photo_galleries = @category.photo_galleries
    end
  end
end
