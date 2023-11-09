class PasswordsController < ApplicationController
  before_action :set_account

  def edit; end

  def update
    if @account.update(user_params)
      redirect_to home_path, notice: "Your password has been changed"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_account
    @account = Current.account
  end

  def user_params
    params.permit(:password, :password_confirmation, :password_challenge).with_defaults(password_challenge: "")
  end
end
