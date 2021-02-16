class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :Product
  has_one :address
  has_one :purchase
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
  with_options presence: true do
    validates :nickname
    with_options format: {with: /\A[ぁ-んァ-ン一-龥々]/ } do
    validates :last_name
    validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
    end
    validates :birth_date
  end
      
    VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,100}\z/
    validates :password, format: { with: VALID_PASSWORD_REGEX,
                        message: "Password include both letters and numbers"}
end