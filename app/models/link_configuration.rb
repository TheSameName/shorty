class LinkConfiguration < ApplicationRecord
  belongs_to :link

  has_one_attached :image
end
