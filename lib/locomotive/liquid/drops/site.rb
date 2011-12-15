module Locomotive
  module Liquid
    module Drops
      class Site < Base

        delegate :name, :seo_title, :meta_keywords, :meta_description, :to => '_source'

        def initialize(source)
          super(source)

          for gallery in self._source.photo_galleries
            method_name = (gallery.title.downcase + "_gallery").to_sym

            self.class.send :define_method, method_name do
              gallery.to_liquid
            end
          end
        end
  
        def index
          @index ||= self._source.pages.root.first
        end

        def pages
          @pages ||= liquify(*self._source.pages)
        end

        def photo_galleries
          @photo_galleries ||= liquify(*self._source.photo_galleries)
        end

        def photo_gallery
          @photo_gallery ||= liquify(*self._source.photo_galleries.first)
        end

        def photo_gallery_photos
          @photo_gallery_photos ||= liquify(*self._source.photo_galleries.first.sorted_photos)
        end

      end
    end
  end
end
