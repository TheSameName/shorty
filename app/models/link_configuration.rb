class LinkConfiguration < ApplicationRecord
  belongs_to :link

  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true

  validate :validate_image_type
  validate :validate_image_size

  private

  def validate_image_type
    return unless image.attached?

    errors.add(:image, "must be a JPEG, PNG or WEBP") unless image.content_type.in?(%w[image/jpeg image/png image/webp])
  end

  def validate_image_size
    return unless image.attached?

    errors.add(:image, "must be less than 5MB") if image.byte_size > 5.megabytes
  end
end
