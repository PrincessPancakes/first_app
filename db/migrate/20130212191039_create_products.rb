class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :brand
      t.belongs_to :category
      t.string :gender
      t.string :identifier
      t.string :name
      t.string :url
      t.string :material
      t.string :status
      t.integer :sizes

      t.timestamps
    end
    add_index :products, :brand_id
    add_index :products, :category_id
    add_index :products, [:brand_id, :identifier]
  end
end
