class Admin::PostsController < Admin::BaseController
  load_and_authorize_resource :param_method => :post_param
  def index
    @posts = Post.page(params[:page])
  end

  def update
    respond_to do |format|
      if @post.update(post_param)
        format.html { render :show }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def post_param
    params.require(:post).permit(:title, :content)
  end

end
