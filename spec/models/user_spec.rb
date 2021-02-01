require 'rails_helper'

RSpec.describe User, type: :model do
    before do
     @user = FactoryBot.build(:user)
    end
   describe 'ユーザー新規登録' do
      context '新規登録できるとき' do

        it "全ての項目の入力が存在すれば登録できること" do
          @user.valid?
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it "nicknameがない場合は登録できないこと" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end
        it "emailがない場合は登録できないこと" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "emailに＠がない場合は登録できないこと" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
  
        it "passwordがない場合は登録できないこと" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
      
        it "password_confirmationがない場合は登録できないこと" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end  
  
        it "passwordの値が英語のみでは登録できないこと" do
          @user.password = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "passwordの値が数字のみでは登録できないこと" do
          @user.password = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "last_nameがない場合は登録できないこと" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "last_name_kanaがない場合は登録できないこと" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
  
        it "first_nameがない場合は登録できないこと" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
  
        it "first_name_kanaがない場合は登録できないこと" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
  
        it "birth_dateがない場合は登録できないこと" do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
  
        it "passwordが5文字以下であれば登録できないこと" do
          @user.password = "q1111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
  
        it "重複したemailが存在する場合は登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
  
        it 'last_nameが全角入力でなければ登録できないこと' do
          @user.last_name = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
  
        it 'first_nameが全角入力でなければ登録できないこと' do
          @user.first_name = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
          @user.last_name_kana = "あいうえお"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end
  
        it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
          @user.first_name_kana = "あいうえお"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
      end
    end
  end
