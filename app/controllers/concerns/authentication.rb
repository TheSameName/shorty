module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate!
  end

  def current_account
    Current.account
  end

  private

  def authenticate!
    if (session = Session.find_by(id: cookies.signed[:session_token]))
      Current.session = session
    else
      redirect_to sign_in_url
    end
  end
end
