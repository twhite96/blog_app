class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @user = User.find(params[:id])
    User.find_by_username(params[:username]) == User.find_by(username: params[:username])
  end

  # GET new user
  def new
    @user = User.new
  end

  # GET users/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST: Create new user
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user }
      else
        format.html { render :new }
        format.json { render @user.errors.full_messages, status: 422 }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def delete_user
    @user.delete_user
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
    end
  end

  private
    
    def set_user
      @user = User.find(params[:id])
    end

   # Make sure no nefarious URL params pass through
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
