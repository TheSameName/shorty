class ApplicationController < ActionController::Base
  include Authentication
  include SetCurrentRequestDetails

  private

  def require_lock(wait: 1.hour, attempts: 10)
    counter = Kredis.counter("require_lock:#{request.remote_ip}:#{controller_path}:#{action_name}", expires_in: wait)
    counter.increment

    return unless counter.value > attempts

    redirect_to root_path, alert: "You've exceeded the maximum number of attempts"
  end
end
