class Admin::UsersController < Admin::BaseController

  load_and_authorize_resource :param_method => :user_param
  
  def index
    @user = User.page(params[:page])
  end

  def update
    respond_to do |format|
      if @user.update(user_param)
        format.html { render :show }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_param
    params.require(:user).permit(:title, :content, :password)
  end

end
