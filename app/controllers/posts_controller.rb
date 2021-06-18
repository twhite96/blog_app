class PostsController < ApplicationController
  # callback action
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new 
    @post = Post.new
  end

  def edit
  end

  def create 
    @post = Post.new(post_params)
    # |format| is an argument passed to the respond_to block
    # which is a method on the ActionController class
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors.full_messages, status: 422 }
      end
    end
  end
  
  def update 
    respond_to do |format|
      if @post.update(post_params) 
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully deleted.' }
      format.json { render json: @post.errors.full_messages, status: 422 }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end


end