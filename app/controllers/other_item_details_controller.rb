class OtherItemDetailsController < ApplicationController
  def new
    @other = Other.find params[:other_id]
    @other_item = OtherItem.find params[:other_item_id]	
  end

  def create
    @other = Other.find params[:other_id]
    @other_item = OtherItem.find params[:other_item_id]
    @other_item_detail = @other_item.other_item_details.create other_item_detail_params
     
     @newfeed = Newfeed.new
     @newfeed.other_item_detail_id = @other_item_detail.id
     @newfeed.save

     redirect_to other_other_item_path(@other, @other_item)
  end

  def show
    @other = Other.find params[:other_id]
    @other_item = OtherItem.find params[:other_item_id]
    @other_item_detail = OtherItemDetail.find params[:id]
  end

  def edit
    @other = Other.find params[:other_id]
    @other_item = OtherItem.find params[:other_item_id]
    @other_item_detail = OtherItemDetail.find params[:id]
  end

  def update
    @other = Other.find params[:other_id]
    @other_item = OtherItem.find params[:other_item_id]
    @other_item_detail = OtherItemDetail.find params[:id]

    if @other_item_detail.update_attributes other_item_detail_params
      redirect_to other_other_item_other_item_detail_path(@other, @other_item, @other_item_detail)
    else
      render 'edit'
    end
  end

  def destroy
    @other = Other.find params[:other_id]
    @other_item = OtherItem.find params[:other_item_id]
    @other_item_detail = OtherItemDetail.find params[:id]
    @other_item_detail.destroy
    redirect_to other_other_item_path(@other, @other_item)
  end

  private
  def other_item_detail_params
    params.require(:other_item_detail).permit(:name, :author,
    	:postor, :translator, :source, :description, :content, :url,
    	:image_link, :image_upload, :view, :params, :during,
       :place, :status)
  end
end
