class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_number,    default: "",    null: false
      t.integer :prefecture_id,                 null: false
      t.string :city,           default: "",    null: false
      t.string :house_number,   default: "",    null: false
      t.string :building_name,  default: ""
      t.references :purchase,                   null: false,    foreign_key: true
      t.string :phone_number,                   null: false
      t.timestamps
    end
  end
end
