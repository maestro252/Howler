class GrowlsController < ApplicationController

  def create
    @growl = Growl.new growl_params
    @growl.user = User.all.first

    redirect_to @growl if @growl.save
    render :new if !(@growl.save)
  end

  def index
  end

  def show
    @growl = User.first.growls.find(params[:id])
  end

  def new
    @growl = Growl.new
  end

private

  def growl_params
    params.require(:growl).permit(:content)
  end

end
