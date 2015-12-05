class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.build(favoritable: @post)
    @favorite.save
    redirect_to @post
  end
end
