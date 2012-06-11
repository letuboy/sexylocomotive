module Locomotive
  module Liquid
    module Drops
      class PhotoGallery < Base
        delegate :title, :to => '_source'

        def photos
          @photos ||= liquify(*self._source.sorted_photos)
        end

        def random_photos
          liquify(*self._source.random_photos(6))
        end
      end
    end
  end
end
