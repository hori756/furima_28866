class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.references :purchase,                     null: false,  foreign_key: true
      t.string :post_code,    default: "",  null: false
      t.integer :prefecture_id,                  null: false
      t.string :city,           default: "", null: false
      t.string :adress,  default: "", null: false
      t.string :build_name,  default: ""
      t.string :phone_number,   default: "", null: false
      t.timestamps
    end
  end
end
