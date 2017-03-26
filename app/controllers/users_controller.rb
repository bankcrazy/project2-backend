class UsersController < ApplicationController
  skip_before_action :check_jwt_for_current_user, only: [:api_sign_in, :api_sign_out, :register]
  respond_to :json

  def check_signed_in
    render json: { success: true }
  end

  def api_sign_in
    user = User.find_by_email(params[:user][:email])
    if user.valid_password?(params[:user][:password])
      cookies[:user_jwt] = { value: user.generate_jwt, http_only: true }
      render json: { success: true }
    else
      render json: { success: false }, status: :unauthorized
    end
  end

  def api_sign_out
    reset_session
    cookies.delete(:user_jwt)
    render json: { success: true, status: :unauthorized }
  end

  def register
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { render :new}
        format.json { render json: @user.to_json }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
