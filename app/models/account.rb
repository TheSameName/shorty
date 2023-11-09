class Account < ApplicationRecord
  before_validation :unverify_email, if: :email_changed?, on: :update
  after_update :logout_previous_sessions!, if: :password_digest_previously_changed?

  has_many :sessions, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :email, not_pwned: { message: "has been found in a data breach" }

  validates :password, allow_nil: true, length: { minimum: 8 }
  validates :password, not_pwned: { message: "might easily be guessed" }

  has_secure_password

  generates_token_for :email_verification, expires_in: 2.days do
    email
  end
  generates_token_for :password_reset, expires_in: 20.minutes do
    password_salt.last(10)
  end

  normalizes :email, with: -> { _1.strip.downcase }

  private

  def unverify_email
    self.verified = false
  end

  def logout_previous_sessions!
    sessions.where.not(id: Current.session).delete_all
  end
end
