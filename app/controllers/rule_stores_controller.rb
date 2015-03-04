class RuleStoresController < ApplicationController
  def index
  end

  def new
    @rule_store = RuleStore.new
  end

  def create
    @rule_store = RuleStore.new rule_store_params
    if @rule_store.save
      redirect_to root_path
    else
      flash[:danger] = "Create fails, please retry."
      render 'new'
    end
  end

  def show
    @rule_store = RuleStore.find params[:id]
    @rules = @rule_store.rules.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def edit
    @rule_store = RuleStore.find params[:id]
  end

  def update
    @rule_store = RuleStore.find params[:id]
    if @rule_store.update_attributes rule_store_params
      redirect_to rule_store_path(@rule_store)
    else
      render 'edit'
    end
  end

  def destroy
    @rule_store = RuleStore.find params[:id]
    @rule_store.destroy
    redirect_to root_path
  end

  private
  def rule_store_params
    params.require(:rule_store).permit(:name, :description)
  end
end
