class PostsController < ApplicationController

  load_and_authorize_resource :param_method => :post_param

  def index
  	@post = Post.page(params[:page])
  end
  
  def new  
    if logged_in?
  	  @post = Post.new
      @post_list = current_user.posts
    else
      redirect_to(:action => 'index') 
    end
  end

  def show
    #@post = Post.find(params[:id])
  end

  def edit
    #@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(post_param)
    @post.user_id = current_user.id
    if @post.save
    	@post = Post.page(params[:page])
    	redirect_to(:action => 'index') 
    else
      redirect_to(:action => 'new') 
    end

  end

  def update
    #@post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_param)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
private
  def post_param
  	params.require(:post).permit(:title, :content)
  end

end
