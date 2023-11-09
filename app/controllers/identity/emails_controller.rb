module Identity
  class EmailsController < ApplicationController
    before_action :set_account

    def edit; end

    def update
      if @account.update(user_params)
        redirect_to_root
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_account
      @account = Current.account
    end

    def user_params
      params.permit(:email, :password_challenge).with_defaults(password_challenge: "")
    end

    def redirect_to_root
      if @account.email_previously_changed?
        resend_email_verification
        redirect_to home_path, notice: "Your email has been changed"
      else
        redirect_to home_path
      end
    end

    def resend_email_verification
      AccountMailer.with(account: @account).email_verification.deliver_later
    end
  end
end
