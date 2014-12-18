module SessionsHelper
  def log_in(user)
    if user.is_a?Admin
      session[:type_id] = 0
    else
      session[:type_id] = 1
    end
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
    session[:type_id] = -1
    @current_user = nil
  end

  def current_user
    if session[:type_id] == 0
      @current_user ||= Admin.find_by(id: session[:user_id])
    else
      @current_user ||= User.find_by(id: session[:user_id])
    end 
  end

  def logged_in?
    !current_user.nil?
  end

end
