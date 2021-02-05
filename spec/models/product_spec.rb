require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

 describe '商品情報入力' do
   context '出品できるとき' do
   it "ログイン状態なら出品ページへ遷移できる" do

    　
   end
   end
   it "ログアウト状態なら出品ページへ遷移できない" do

    include
   end

   it "商品画像がないと出品できない" do

    include "Image can't be blank"
   end

   it "商品名がないと出品できない"　do

    include "Name can't be blank"
   end

   it "商品説明がないと出品できない" do

    include "Info can't be blank"
   end

   it "カテゴリーの情報がないと出品できない" do

    include "Category Select"
   end

   it "商品状態の情報がないと出品できない" do

    include "Sales status Select"
   end

   it "配送料の負担について情報がないと出品できない" do

    include "Shipping fee status Select"
   end

   it "発想元の地域について情報がないと出品できない" do

    include "Prefecture Select"
   end

   it "発送までの日数について情報がないと出品できない" do

    include "Scheduled delivery Select"
   end

   it "価格の情報がないと出品できない" do

    include "Price can't be blank"
   end

   it "価格が300以下だと出品できない" do

    include "Price Out of setting range"
   end

   it "価格が9999999以上だと出品できない" do

    include "Price Out of setting range"
   end

   it "販売価格は半角英数字のみであること" do

    include "Price Half-width number"
   end
  end
end
