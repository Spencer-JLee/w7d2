class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    # debugger
    @user = User.find(params[:id])

    if @user
      # debugger
      render :show
    else
      render :index
    end
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end