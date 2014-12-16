class UsersController < ApplicationController
  
  def login
    @user = User.new
  end

  def logout
    log_out
    redirect_to(:controller => 'posts', :action => 'home') 
  end

  def register
    @user = User.new
  end

  def login_create
    user = User.find_by(email: params[:users][:email].downcase)
    if user && user.authenticate(params[:users][:password])
      log_in(user)
      redirect_to(:controller => 'posts', :action => 'new') 
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login'
    end
  end

  def register_create
    @user = User.new(regieter_param)
    @user.save
    log_in(@user)
    redirect_to(:controller => 'posts', :action => 'new') 
  end

  def regieter_param
    params.require(:users).permit(:name, :email, :password)
  end
  
end
