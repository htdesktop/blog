class UsersController < ApplicationController
  
  def index
    @user = User.page(params[:page])
  end
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      log_in(@user)
      redirect_to(:controller => 'posts', :action => 'new') 
    else
      redirect_to(:action => 'new') 
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_param)
    redirect_to(:action => 'show') 
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    log_out
    redirect_to(:controller => 'posts', :action => 'index') 
  end
  
  def user_param
    params.require(:user).permit(:name, :email, :password)
  end
end
