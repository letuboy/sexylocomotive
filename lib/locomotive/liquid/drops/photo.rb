module Locomotive
  module Liquid
    module Drops
      class Photo < Base
        delegate :title, :to => '_source'
        delegate :desc, :to => '_source'

        def url
          self._source.source.url
        end
      end
    end
  end
end
