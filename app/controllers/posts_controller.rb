class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).includes(:tags)
  end
end
