require "open-uri"
class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :load_user, except: %i(new create index)
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index;end

  def show;end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.avatar.attach(
        io: File.open("app/assets/images/users/icon-user-default.png"),
        filename: Settings.default_avatar_name
      )
      @user.send_activation_email
      flash[:info] = t ".please_check_mail"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes update_user_params
      flash[:success] = t ".profile_updated"
      redirect_to edit_user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit User::DATA_TYPE_USERS
  end

  def update_user_params
    params[:user][:gender] = true if params[:user][:gender] == "1"
    params[:user][:gender] = false if params[:user][:gender] == "0"
    if @user.provider
      params.require(:user).permit User::DATA_TYPE_UPDATE_PROFILE_PROVIDER
    else
      params.require(:user).permit User::DATA_TYPE_UPDATE_PROFILE
    end
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t ".id_unexist"
    redirect_to root_path
  end

  def correct_user
    return if current_user? @user

    flash[:danger] = t ".not_allow"
    redirect_to root_path
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t ".please_log_in"
    redirect_to login_path
  end
end