class UsersController < ApplicationController


  def create
    @user = User.new create_params
    @user.birthdate = DateTime.parse create_params[:birthdate]
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
    @user = User.find(params[:id]) 
  end

  def destroy

  end

private

  def create_params
    params.require(:user).permit(:name, :lastname, :birthdate, :username, :email)
  end

end
