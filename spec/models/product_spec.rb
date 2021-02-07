require 'rails_helper'

RSpec.describe Product, type: :model do
 before do
  @product = FactoryBot.build(:product)
  
 end 

   describe '商品情報入力' do

    context '出品できる時' do

      it "全ての値が入っていれば登録できる" do
        expect(@product).to be_valid
      end
    end

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
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Category is not a number"
      end
     
     it "categoryの値が'1'では登録できない" do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Category must be other than 1"
     end
       
     it "conditionの情報がないと出品できない" do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Condition is not a number"
     end
     
     it "conditionの値が'1'だと登録ができない" do
        @product.condition_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Condition must be other than 1"
     end

     it "costについて情報がないと出品できない" do
        @product.cost_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Cost is not a number"
     end
     
     it "costの値が'1'だと登録ができない" do
        @product.cost_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Cost must be other than 1"
     end

     it "prefectureついて情報がないと出品できない" do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture is not a number"
     end
     
     it "prefectureの値が'1'だと登録ができない" do
        @product.prefecture_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture must be other than 1"
     end

     it "daysについて情報がないと出品できない" do
        @product.days_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Days is not a number"
     end

     it "daysの値が'1'だと登録ができない" do
        @product.days_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Days must be other than 1"
     end
      
     it "priceについて情報がないと出品できない" do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not a number"
     end
     
     it "価格が300以下だと出品できない" do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include "Price must be greater than or equal to 300"
     end
     
     it "価格が9999999以上だと出品できない" do
        @product.price = 10000000
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