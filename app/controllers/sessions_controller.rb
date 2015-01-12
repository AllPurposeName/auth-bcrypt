class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login successful"
      redirect_to user_path(@user)
    else
      flash[:errors] = "Invalid login"
      render :new
    end
  end

end
