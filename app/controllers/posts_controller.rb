# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update]

  def index; end

  def new
    @post = Post.new
  end

  def show
    @comment = @post.comments.build
    @comments = @post.comments.order(created_at: :asc)
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :user_id, :image)
  end
end
