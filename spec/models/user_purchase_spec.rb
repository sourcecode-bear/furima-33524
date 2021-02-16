require 'rails_helper'

RSpec.describe UserPurchase, type: :model do

   before do
     @user_purchase = FactoryBot.build(:user_purchase)
   end
   describe '購入情報の保存' do
     context '購入ができる時' do
       
      it "全ての項目が正く存在すれば登録できること" do
       expect(@user_purchase).to be_valid
      end

      it "building_nameがなくても登録できること" do
        @user_purchase.building_name = ""
        expect(@user_purchase).to be_valid
       end
      
     end

     context '購入できない時' do

      it "user_idが存在しないと購入できない" do
        @user_purchase.user_id = ""
        @user_purchase.valid?
      end

      it "procudt_idが存在しないと購入できない" do
        @user_purchase.product_id = ""
        @user_purchase.valid?
      end

      it "tokenの値が空だと購入できない" do
         @user_purchase.token = ""
         @user_purchase.valid?
         expect(@user_purchase.errors.full_messages).to include "Token can't be blank"
      end

      it "post_numberの値が空だと購入できない" do
        @user_purchase.post_number = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include "Post number can't be blank"
      end

      it "post_numberの値がハイフン無しでは購入できない" do
        @user_purchase.post_number = "1234567"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include "Post number is invalid"
      end

      it "post_numberが半角英数字を含んだ正しい形式でないと購入できない" do
        @user_purchase.post_number = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include "Post number is invalid"
      end

      it "prefecture_idの値が'1'だと購入できない" do
        @user_purchase.prefecture_id = '1'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include "Prefecture can't be blank"
      end

      it "cityの値が空だと購入できない" do
        @user_purchase.city = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include "City can't be blank"
      end

      it "house_numberの値が空だと購入できない" do
        @user_purchase.house_number = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include "House number can't be blank"
      end

      it "phone_numberの値が空だと購入できない" do
        @user_purchase.phone_number = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include "Phone number can't be blank"
     end

      it "phone_numberは12桁以上だと購入できない" do
        @user_purchase.phone_number = "111111111111"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include "Phone number is invalid"
     end

     it "phone_numberの値が英数混合だと購入できない" do
        @user_purchase.phone_number = "a1111111111"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include "Phone number is invalid"
     end
    end
  end
end
