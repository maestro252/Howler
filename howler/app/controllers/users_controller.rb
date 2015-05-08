class UsersController < ApplicationController


  def create
    @user = User.new create_params
    redirect_to @user if @user.save
    render :new if !(@user.save)
  end

  def new
    @user = User.new
  end

  def update

  end

  def index

  end

  def show

  end

  def destroy

  end

private

  def create_params
    @user.require(:email, :username, :password).permit(:name, :lastname, :birthdate)
  end

end
