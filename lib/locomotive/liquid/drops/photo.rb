module Locomotive
  module Liquid
    module Drops
      class Photo < Base
        delegate :title, :to => '_source'

        def url
          self._source.source.url
        end

        def test
          "test"
        end
      end
    end
  end
end
