class PostsController < ApplicationController

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(current_user), notice: 'Новый пост создан'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :user_id)
  end
end
