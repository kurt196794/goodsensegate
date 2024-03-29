class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.references :soldout, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.string :municipalities, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.integer :delivery_area_id, null: false
      t.timestamps
    end
  end
end
