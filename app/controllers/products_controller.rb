class ProductsController < ApplicationController

  before_action :authenticate_user!, except:[:index, :show]
  
 def index
    @products = Product.order("created_at DESC")
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
 
  def show
    @product = Product.find(params[:id])
  end

   def edit
    @product = Product.find(params[:id])
        redirect_to root_path if @product.user.id != current_user.id  
    end
  

    



  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
   end
  end


 private

 def product_params
  params.require(:product).permit(:image, :title, :text, :category_id, :condition_id, :cost_id, :days_id, :prefecture_id, :product_id, :price).merge(user_id: current_user.id)
 end    
end


