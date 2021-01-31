require 'rails_helper'

RSpec.describe User, type: :model do
    before do
     @user = FactoryBot.build(:user)
    end
   describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it "全ての項目の入力が存在すれば登録できること" do
          expect(FactoryBot.create(:user)).to be_valid
        end
      end
      context '新規登録できないとき' do
        it "nicknameがない場合は登録できないこと" do
          expect(FactoryBot.build(:user, nickname: "")).to_not be_valid include("Nickname can't be blank")
        end
        it "emailがない場合は登録できないこと" do
          expect(FactoryBot.build(:user, email: "")).to_not be_valid include("Email can't be blank")
        end

        it "emailに＠がない場合は登録できないこと" do
          expect(FactoryBot.build(:user, email: "@")).to_not be_valid include("Email can't be @")
        end
  
        it "passwordがない場合は登録できないこと" do
          expect(FactoryBot.build(:user, password: "")).to_not be_valid include("Password can't be blank")
        end
  
        it "encrypted_passwordがない場合は登録できないこと" do
          expect(FactoryBot.build(:user, password: "")).to_not be_valid include("Encryted_Password can't be blank")
        end
  
        it "passwordの値が英語のみでは登録できないこと" do
          expect(FactoryBot.build(:user, password: "aaaaaa")).to_not be_valid include("Password is invalid")
        end

        it "passwordの値が全角では登録できないこと" do
          expect(FactoryBot.build(:user, password: "AAAAAA")).to_not be_valid include("Password is invalid")
        end

        it "last_nameがない場合は登録できないこと" do
          expect(FactoryBot.build(:user, last_name: "")).to_not be_valid include("Last name can't be blank")
        end

        it "last_name_kanaがない場合は登録できないこと" do
          expect(FactoryBot.build(:user, last_name_kana: "")).to_not be_valid include("Last name kana can't be blank")
        end
  
        it "first_nameがない場合は登録できないこと" do
          expect(FactoryBot.build(:user, first_name: "")).to_not be_valid include("First name can't be blank")
        end
  
        it "first_name_kanaがない場合は登録できないこと" do
          expect(FactoryBot.build(:user, first_name_kana: "")).to_not be_valid include("First name kana can't be blank")
        end
  
        it "birth_dateがない場合は登録できないこと" do
          expect(FactoryBot.build(:user, birth_date: "")).to_not be_valid include("Birth date can't be blank")
        end
  
        it "passwordが6文字以上であれば登録できること" do
          expect(FactoryBot.build(:user, password: "123456", encrypted_password: "123456")).to be_valid
        end
  
        it "passwordが5文字以下であれば登録できないこと" do
          expect(FactoryBot.build(:user, password: "12345", encrypted_password: "12345")).to_not be_valid include("Encrypted password is too short (minimum is 6 characters)")
        end
  
        it "重複したemailが存在する場合は登録できないこと" do
          expect(FactoryBot.build(:user, email: "user.email")).to_not be_valid
        end
  
        it 'last_nameが全角入力でなければ登録できないこと' do
          expect(FactoryBot.build(:user, last_name: "ｱｲｳｴｵ")).to_not be_valid  include("Last name is invalid")
        end
  
        it 'first_nameが全角入力でなければ登録できないこと' do
          expect(FactoryBot.build(:user, first_name: "ｱｲｳｴｵ")).to_not be_valid  include("first name is invalid")
        end

        it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
          expect(FactoryBot.build(:user, last_name_kana: "あいうえお")).to_not be_valid  include("Last name kana is invalid")
        end
  
        it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
          expect(FactoryBot.build(:user, first_name_kana: "あいうえお")).to_not be_valid include("Last name kana is invalid")
        end
      end
    end
  end
