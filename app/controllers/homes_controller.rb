class HomesController < ApplicationController
  def index
  	@home = Home.first
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new home_params
    if @home.save
      redirect_to homes_path
    else
    	flash[:danger] = "Create fails, please retry."
      render 'new'
    end
  end

  def edit
    @home = Home.find params[:id]
  end

  def update
    @home = Home.find params[:id]
    if @home.update_attributes home_params
      redirect_to homes_path
    else
      render 'edit'
    end
  end

  private
  def home_params
    params.require(:home).permit(:content)
  end

end
