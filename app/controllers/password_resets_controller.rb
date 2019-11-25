class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new; end

  def create
    @user = User.find_by_email_and_provider(
      params[:password_reset][:email].downcase, nil
    )
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t ".notice_sent_reset_password_instructions"
      redirect_to root_path
    else
      flash.now[:danger] = t ".email_address_not_found"
      render :new
    end
  end

  def edit; end

  def update
    @user.assign_attributes user_params
    if @user.save context: :update_info
      log_in @user
      @user.update_attribute :reset_digest, nil
      flash[:success] = t ".password_has_been_reset"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit User::DATA_TYPE_RESETS_PASSWORD
  end

  def get_user
    @user = User.find_by email: params[:email].downcase
    return if @user

    flash.now[:danger] = t ".email_address_not_found"
    render :new
  end

  # Confirms a valid user.
  def valid_user
    redirect_to root_path unless
      @user&.activated? && @user&.authenticated?(:reset, params[:id])
  end

  # Checks expiration of reset token.
  def check_expiration
    return unless @user.password_reset_expired?

    flash[:danger] = t ".password_reset_has_expired"
    redirect_to new_password_reset_path
  end
end
