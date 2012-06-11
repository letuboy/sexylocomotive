
class Category
  include Locomotive::Mongoid::Document

  field :name

  has_many :photo_galleries
  referenced_in :site
end
