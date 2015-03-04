class BannersController < ApplicationController
  def index
    @banners = Banner.all
  end

  def new
   @banner = Banner.new
  end
    
  def create
     @banner = Banner.new
     @banner.url = params[:banner][:url]
     @banner.save

    redirect_to banners_path
  end

  def destroy
    @banner = Banner.find params[:id]
    @banner.destroy
    redirect_to banners_path
  end
end
