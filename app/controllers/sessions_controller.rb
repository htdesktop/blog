class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.authenticate(params[:user][:password])
      log_in(user)
      redirect_to(:controller => 'posts', :action => 'new') 
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to(:action => 'new') 
    end
  end

  def destroy
    log_out
    redirect_to(:controller => 'posts', :action => 'index')
  end
end
