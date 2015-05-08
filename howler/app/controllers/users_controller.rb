class UsersController < ApplicationController

  respond_to :json

  def create
    @user = User.new create_params

    render json: {success: true, user: @user},  except: [:password, :salt] if @user.save
    render json: {success: false, errors: @user.errors} if !(@user.save)
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
