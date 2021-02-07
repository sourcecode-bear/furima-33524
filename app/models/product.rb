class Product < ApplicationRecord
   belongs_to :user
   has_one_attached :image
   #下記のように記述して「moduleモジュールを取り込む」
   extend ActiveHash::Associations::ActiveRecordExtensions
   #_idが付くモデル（クラス）と紐付ける
   belongs_to :category
   belongs_to :condition
   belongs_to :cost
   belongs_to :prefecture
   belongs_to :days

   #ジャンルの選択が「--」の時は保存できないようにする
   with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefecture_id
    validates :days_id
   end
   
   with_options presence: true do
    validates :image
    validates :title
    validates :text
   end
    validates :price,numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
end
