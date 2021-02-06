require 'rails_helper'

RSpec.describe Product, type: :model do
 before do
  @product = FactoryBot.build(:product)
 end
    
   describe '商品情報入力ページへの遷移' do

    context '商品情報入力ページへ遷移できない' do

     it "ログアウト状態だと出品ページへ遷移できない" do
     @product.user_id = nil
     expect(@product.errors.full_messages).to include "You need to sign in or sign up before continuing."
     end
    end
   end
     
   describe '商品情報入力' do

    context '出品できない時' do

     it "imageがないと出品できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
     end
     
     it "titleがないと出品できない" do
        @product.title = ""
        @product.valid?
        expect(@product.errors.full_messages).to include "Title can't be blank"
     end
     
     it "textがないと出品できない" do
        @product.text = ""
        @product.valid?
        expect(@product.errors.full_messages).to include "Text can't be blank"
     end
     
     it "categoryの情報がないと出品できない" do
        @product.category_id
        @product.valid?
        expect(@product.errors.full_messages).to include include "Category must be other than 1"
     end
     
     it "conditionの情報がないと出品できない" do
        @product.condition_id
        @product.valid?
        expect(@product.errors.full_messages).to include "Condition must be other than 1"
     end
     
     it "costについて情報がないと出品できない" do
        @product.cost_id
        @product.valid?
        expect(@product.errors.full_messages).to include "Cost must be other than 1"
     end
     
     it "prefectureついて情報がないと出品できない" do
        @product.prefecture_id 
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture must be other than 1"
     end
     
     it "daysについて情報がないと出品できない" do
        @product.days_id
        @product.valid?
        expect(@product.errors.full_messages).to include "Days must be other than 1"
     end
     
     it "priceについて情報がないと出品できない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not a number"
     end
     
     it "価格が300以下だと出品できない" do
        @product.price = "299"
        @product.valid?
        expect(@product.errors.full_messages).to include "Price must be greater than or equal to 300"
     end
     
     it "価格が9999999以上だと出品できない" do
        @product.price = "10000000"
        @product.valid?
        expect(@product.errors.full_messages).to include "Price must be less than or equal to 9999999"
     end
     
     it "価格が半角英数字以外だと出品できない" do
        @product.price = "１１１１１１"
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not a number"
     end
    end
   end
end