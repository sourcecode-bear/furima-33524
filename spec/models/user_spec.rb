require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
      it "nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name, first_name_kanaとlsst_name_kana, birth_dateが存在すれば登録できる" do
       expect(@user).to be_valid
      end
    it "nicknameがあれば登録できる" do
      expect(@user).to be_valid
    end
    it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      expect(@user).to be_valid
    end
    it "first_nameがあれば登録できる" do
      expect(@user).to be_valid
    end
    it "last_nameがあれば登録できる" do
      expect(@user).to be_valid
    end
    it "first_name_kanaがあれば登録できる" do
      expect(@user).to be_valid
    end
    it "last_name_kanaがあれば登録できる" do
      expect(@user).to be_valid
    end
    it "birth_dateがあれば登録できる" do
      expect(@user).to be_valid
    end
   end
    context '新規登録できないとき'　do
     it "nicknameが空では登録できない" do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空では登録できない" do
      @user.password = ''
      @user.valid?
    end
    it "last_nameが空では登録できない" do
      @user.password = ''
      @user.valid?
    end
    it "first_name_kanaが空では登録できない" do
      @user.password = ''
      @user.valid?
    end
    it "last_name_kanaが空では登録できない" do
      @user.password = ''
      @user.valid?
    end
    it "birth_dateが空では登録できない" do
      @user.password = ''
      @user.valid?
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
