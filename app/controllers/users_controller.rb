class UsersController < ApplicationController
  before_filter :correct_user, only: [:edit, :destroy]

  def index
    @users = User.all
  end

  def create
    @user = User.create(params[:user])
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user.errors.delete(:password_digest) if @user.errors[:password_digest]
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end


  private

    def correct_user
      redirect_to root_url unless current_user && params[:id] == current_user.id
    end

end
