class CreatePastries < ActiveRecord::Migration
  def change
    create_table :pastries do |t|
      t.string :name
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
