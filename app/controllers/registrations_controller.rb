class RegistrationsController < ApplicationController
  skip_before_action :authenticate!

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(user_params)

    if @account.save
      session = @account.sessions.create!

      create_session_cookie(session)

      send_email_verification

      redirect_to home_path, notice: "Welcome! You have signed up successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def send_email_verification
    AccountMailer.with(account: @account).email_verification.deliver_later
  end
end
