class RedirectsController < ApplicationController
  before_action :find_link

  def show
    redirect_to @link.url, allow_other_host: true
  end

  private

  def find_link
    @link = Link.find_by!(slug: params[:slug])
  end
end
