class Admin::SessionsController < Admin::BaseController

  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.find_by(name: params[:user][:name].downcase)
    if admin && admin.authenticate(params[:user][:password])
      log_in(admin)
      redirect_to(:controller => 'posts', :action => 'index') 
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to(:action => 'new') 
    end
  end

  def destroy
    log_out
  end

end