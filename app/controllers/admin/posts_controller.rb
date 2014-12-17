class Admin::PostsController < Admin::BaseController
  
  def index
    @post = Post.page(params[:page])
  end

  def show
  end

  def new
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

end
