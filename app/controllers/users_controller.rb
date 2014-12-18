class UsersController < ApplicationController

  load_and_authorize_resource :param_method => :user_param
  
  def index
    @user = User.page(params[:page])
  end
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def create
    if @user.save
      log_in(@user)
      redirect_to new_post_url #(:controller => 'posts', :action => 'new') 
    else
      render :new #(:action => 'new') 
    end
  end
  
  def update
    @user.update(user_param)
    redirect_to(:action => 'show') 
  end
  
  def destroy
    @user.destroy
    log_out
    redirect_to(:controller => 'posts', :action => 'index') 
  end
  
private
  def user_param
    params.require(:user).permit(:name, :email, :password)
  end
end
