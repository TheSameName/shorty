class RedirectsController < ApplicationController
  skip_before_action :authenticate!

  before_action :find_link!
  before_action :save_click!

  def show; end

  private

  def find_link!
    @link = Link.find_by!(slug: params[:slug])
  end

  def save_click!
    Events::Click.create!(
      link: @link,
      remote_ip: request.remote_ip,
      user_agent: request.user_agent,
      referrer: request.referer
    )
  end
end
