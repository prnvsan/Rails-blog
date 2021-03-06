class PostsController < ApplicationController
  load_and_authorize_resource
  
  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post was successfully created"
      redirect_to post_path(@post)
    else
    render 'new'
    end
  end
  

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post was updated"
      redirect_to post_path(@post)
    else
      flash[:notice] = "Post was not updated"
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post was deleted"
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
