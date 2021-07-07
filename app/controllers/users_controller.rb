class UsersController < ApplicationController
  before_action :load_user, only: %i(show update edit)
  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "user.success"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @user = User.find_by id: params[:id]
    if @user.update user_params
      flash[:success] = t "user.success"
      redirect_to @user
    else
      render root_path
    end
  end

  private

  def user_params
    params.require(:user).permit User::PARAMS
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "user.danger"
    redirect_to root_path
  end
end
