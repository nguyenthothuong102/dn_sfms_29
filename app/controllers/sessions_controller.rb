require "open-uri"
class SessionsController < ApplicationController
  before_action :load_user, only: :create

  def new;end

  def create
    auth_hash = request.env["omniauth.auth"]
    if auth_hash
      unless user = User.find_by_provider_and_uid(auth_hash["provider"],
        auth_hash["uid"])
        user = User.create full_name: auth_hash.info.name,
          email: auth_hash.info.email,
          provider: auth_hash.provider, uid: auth_hash.uid,
          password: Settings.password_default,
          password_confirmation: Settings.password_default,
          activated: true
        downloaded_image = open "#{auth_hash.info.image}"
        user.avatar.attach io: downloaded_image,
          filename: Settings.default_avatar_name
      end
      session[:user_id] = user.id
      redirect_back_or user
    else
      if (@user&.authenticate params[:session][:password]) && !@user.provider
        check_activated
      else
        flash.now[:danger] = t ".invalid_credentials"
        render :new
      end
    end
  end

  def failure;end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def load_user
    return if request.env["omniauth.auth"]
    @user = User.find_by email: params[:session][:email].downcase
  end

  def check_activated
    if @user.activated?
      log_in @user
      if params[:session][:remember_me] == Settings.remember_value
        remember @user
      else
        forget @user
      end
      redirect_back_or @user
    else
      message = t ".check_your_email"
      flash[:warning] = message
      redirect_to root_path
    end
  end
end
