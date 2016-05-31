class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
  end

  def show
    @post = Post.includes({:comments => :user}).find(params[:id])
    @comment = Comment.new
  end

  private
  def post_params
    params.require(:post).permit(:title,:body)
  end
end
