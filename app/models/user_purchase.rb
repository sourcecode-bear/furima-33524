class UserPurchase
  include ActiveModel::Model
  attr_accessor :token, :purchase, :product_id,:user_id, :post_number, :phone_number, :city, :house_number, :building_name, :price, :prefecture_id


 with_options presence: true do
  validates :post_number,  format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format: { with: /\A\d{11}\z/ }
  validates :city
  validates :house_number
  validates :token
 end
  validates :prefecture_id,   numericality: { other_than: 1, message: "can't be blank" }
 
  
 def save
  purchase = Purchase.create(product_id: product_id, user_id: user_id)
  Address.create(post_number: post_number, phone_number: phone_number, city: city, house_number: house_number, building_name: building_name, prefecture_id: prefecture_id, purchase: purchase)
  
 end
end
