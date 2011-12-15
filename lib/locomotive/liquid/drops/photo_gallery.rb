module Locomotive
  module Liquid
    module Drops
      class PhotoGallery < Base
        delegate :title, :to => '_source'

        def photos
          @photos ||= liquify(*self._source.sorted_photos)
        end
      end
    end
  end
end
