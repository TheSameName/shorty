class AccountMailer < ApplicationMailer
  def password_reset
    @account = params[:account]
    @signed_id = @account.generate_token_for(:password_reset)

    mail to: @account.email, subject: "Reset your password"
  end

  def email_verification
    @account = params[:account]
    @signed_id = @account.generate_token_for(:email_verification)

    mail to: @account.email, subject: "Verify your email"
  end
end
