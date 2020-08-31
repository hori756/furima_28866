class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user, null: false , foreign_key: true
      #t.references :user, null: false, foreign_key: true
      t.string :name , null: false
      t.text :description , null: false
      t.integer :category_id , null: false
      t.integer :status_id , null: false
      t.integer :postage_payer_id , null: false
      t.integer :prefecture_id , null: false
      t.integer :shipping_day_id , null: false
      t.string :price , null: false
      t.timestamps
    end
  end
end
