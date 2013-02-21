class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.belongs_to :product
      t.string :content

      t.timestamps
    end
    add_index :styles, :product_id
  end
end
