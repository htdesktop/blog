class PostsController < ApplicationController

  load_and_authorize_resource :param_method => :post_param, except: [:create]

  def index
  	@posts = Post.page(params[:page])
  end
  
  def new  
	  @post = Post.new
    @post_list = current_user.posts
  end

  def create
  	@post = current_user.posts.new(post_param)
    authorize! :create, @post
    if @post.save
    	redirect_to(:action => 'index', notice: 'success') 
    else
      render :new
    end
  end

  def update
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
