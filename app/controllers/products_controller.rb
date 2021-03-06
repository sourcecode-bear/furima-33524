class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_barrier, only: [:edit, :update, :destroy]
  
  
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
  end

   def edit
    end
  
  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
   end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end


 private

 def product_params
  params.require(:product).permit(:image, :title, :text, :category_id, :condition_id, :cost_id, :days_id, :prefecture_id, :product_id, :price).merge(user_id: current_user.id)
 end    
 
 def set_product
  @product = Product.find(params[:id])
 end

 def set_barrier
  redirect_to root_path if @product.user.id != current_user.id||@product.purchase
 end
 
end


