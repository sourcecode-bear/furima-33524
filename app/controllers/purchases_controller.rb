class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_barrier
  
  def index
    @user_purchase = UserPurchase.new
  end


  def create
    @user_purchase = UserPurchase.new(user_purchase_params)
    if @user_purchase.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        card: user_purchase_params[:token],
        amount: @product[:price],
        currency: 'jpy'
      )
      @user_purchase.save
      redirect_to root_path
    else
      render "index"
    end
  end

  

 private

 def user_purchase_params
  params.require(:user_purchase).permit(:post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, token:params[:token], product_id:params[:product_id])
 end 

 def set_product
 @product = Product.find(params[:product_id])
 end

 def set_barrier
  redirect_to root_path if @product.user.id == current_user.id || @product.purchase
 end

end