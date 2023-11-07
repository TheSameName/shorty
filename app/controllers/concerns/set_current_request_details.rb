module SetCurrentRequestDetails
  extend ActiveSupport::Concern

  included do
    before_action do
      Current.user_agent = request.user_agent
      Current.ip_address = request.ip
    end
  end
end
