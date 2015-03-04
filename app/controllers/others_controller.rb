class OthersController < ApplicationController
  def new
    @other = Other.new
  end

  def create
    @other = Other.new other_params
    if @other.save
      redirect_to root_path
    else
      flash[:danger] = "Create fails, please retry."
      render 'new'
    end
  end

  def edit
    @other = Other.find params[:id]
  end

  def update
    @other = Other.find params[:id]
    if @other.update_attributes other_params
    	redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    @other = Other.find params[:id]
  end

  def destroy
    @other = Other.find params[:id]
    @other.destroy
    redirect_to root_path
  end

  private
  def other_params
    params.require(:other).permit(:name)
  end

end
