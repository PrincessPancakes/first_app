class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :website

      t.timestamps
    end
    add_index :brands, :name

  end
end
