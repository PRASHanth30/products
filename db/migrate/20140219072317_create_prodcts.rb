class CreateProdcts < ActiveRecord::Migration
  def change
    create_table :prodcts do |t|
      t.string :name
      t.text :description
      t.string :imgurl
      t.float :price
      t.string :availability
      
      t.timestamps
    end
  end
end
