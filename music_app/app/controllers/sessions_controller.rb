class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # debugger
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    # debugger
    if @user
      # debugger
      login(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end