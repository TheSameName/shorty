class Link < ApplicationRecord
  URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

  after_create :generate_slug

  has_many :link_configurations, dependent: :destroy

  has_many :clicks, as: :owner, # TODO: add counter_cache
    class_name: "Events::Click",
    dependent: :destroy

  accepts_nested_attributes_for :link_configurations, reject_if: :all_blank, allow_destroy: true

  validates :url, presence: true
  validates :url, format: { with: URL_REGEXP }

  def short_url
    return unless slug

    Rails.application.routes.url_helpers.short_url(slug)
  end

  private

  def generate_slug
    update slug: Base62.encode(id)
  end
end
