class ItemsController < ApplicationController
  #ログインしていないと出品ページに遷移できないようにページ制限をする
  before_action :authenticate_user!, except:[:index]

 def index
  
 end

  def new
    @products = Product.order("created_at DESC")
  end

  def create
    @items = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
 

 private

 def product_params
  params.require(:product).permit(:image, :title, :text, :category_id, :condition_id, :cost_id, :days_id, :prefecture_id, :product_id)
 end
end