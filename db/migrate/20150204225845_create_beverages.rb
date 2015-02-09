class CreateBeverages < ActiveRecord::Migration
  def change
    create_table :beverages do |t|
      t.string :bev_type
      t.float :price
      t.integer :quantity
      t.string :roast
      t.date :expiration_date
      t.string :brew

      t.timestamps
    end
  end
end
