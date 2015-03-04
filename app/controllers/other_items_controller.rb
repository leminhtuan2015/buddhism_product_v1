class OtherItemsController < ApplicationController
 def new
   @other = Other.find params[:other_id]
 end

 def create
    @other = Other.find params[:other_id]
    @other_item = @other.other_items.create other_item_params
    redirect_to root_path
 end

 def show
    @other = Other.find params[:other_id]
    @other_item = OtherItem.find params[:id]
    @other_item_details = @other_item.other_item_details
 end

 def edit
    @other_item = OtherItem.find params[:id]
 end

 def update
   @other_item = OtherItem.find params[:id]
    if @other_item.update_attributes other_item_params
      redirect_to other_other_item_path(@other_item.other, @other_item)
    else
      render 'edit'
    end
 end

 def destroy
    @other_item = OtherItem.find params[:id]
    @other_item.destroy
    redirect_to root_path
 end

  private
  def other_item_params
    params.require(:other_item).permit(:name)
  end

end
