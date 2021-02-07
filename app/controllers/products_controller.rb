class ProductsController < ApplicationController
  #ログインしていないと出品ページに遷移できないようにページ制限をする
  before_action :authenticate_user!, except:[:index]

 def index
  
 end

  def new
    @product = Product.new
  end

  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
 
  

 private

 def product_params
  params.require(:product).permit(:image, :title, :text, :category_id, :condition_id, :cost_id, :days_id, :prefecture_id, :product_id, :price).merge(user_id: current_user.id)
 end
end