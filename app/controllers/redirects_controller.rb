class RedirectsController < ApplicationController
  layout "custom-tags"

  before_action :find_link

  def show; end

  private

  def find_link
    @link = Link.find_by!(slug: params[:slug])
  end
end
