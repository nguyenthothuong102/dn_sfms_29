module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    return User.find_by(id: session[:user_id]) if session[:user_id]
    return unless cookies.signed[:user_id]

    user = User.find_by(id: cookies.signed[:user_id])
    return unless user&.authenticated? :remember, cookies[:remember_token]

    log_in user
    user
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
  end
end
