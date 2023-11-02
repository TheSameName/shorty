IMAGE_MIMETYPES = %w[
  image/bmp
  image/gif
  image/jpg
  image/jpeg
  image/png
  image/svg+xml
  image/tiff
  image/webp
].freeze

UNSAFE_MIMETYPES = %w[
  text/html
  text/xml
  application/xml
  application/xhtml+xml
  application/mathml+xml
  text/javascript
  application/javascript
  application/postscript
  text/cache-manifest
  image/svg+xml
].freeze

# @see https://guides.rubyonrails.org/v7.1/configuring.html#configuring-active-storage
Rails.application.config.to_prepare do
  Rails.application.configure do
    config.active_storage.routes_prefix = ENV.fetch("ACTIVE_STORAGE_PREFIX", "/b")
    config.x.upload.max_size = ENV.fetch("UPLOAD_MAX_SIZE", 5.megabytes)
    config.x.upload.allowed_types = IMAGE_MIMETYPES
    config.active_storage.content_types_allowed_inline = IMAGE_MIMETYPES
    config.active_storage.content_types_to_serve_as_binary = UNSAFE_MIMETYPES
  end
end
