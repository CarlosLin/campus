require 'uri'
class PostsController < ApplicationController
  layout 'post'
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  authorize_resource
  def index
    @posts = Post.all
  end

  def index_all
    @posts = Post.all
  end

  def show
    if user_signed_in?
      @post_favorite =  current_user.favorites.where(:favoritable_id => @post.id)
    end
    @post.punch(request)
    @messages = Message.where(post_id: @post)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    Post.getCoverImg(@post) if !@post.avatar_file_name?
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    Post.getCoverImg(@post) if !@post.avatar_file_name?
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:name, :content, :avatar)
    end
end
