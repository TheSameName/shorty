class Session < ApplicationRecord
  before_create :set_account_info

  belongs_to :account

  private

  def set_account_info
    self.user_agent = Current.user_agent
    self.ip_address = Current.ip_address
  end
end
