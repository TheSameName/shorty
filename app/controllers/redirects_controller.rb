class RedirectsController < ApplicationController
  skip_before_action :authenticate!

  before_action :find_link!
  before_action :save_click

  def show; end

  private

  def find_link!
    @link = Link.find_by!(slug: link_params[:slug])
  end

  # TODO: Move logic to component/service
  def save_click
    Events::Click.create(
      link: @link,
      remote_ip: request.remote_ip,
      user_agent: request.user_agent,
      referrer: request.referer,
      utm_source: link_params[:utm_source]
    )
  end

  def link_params
    params.permit(:slug, :utm_source)
  end
end
