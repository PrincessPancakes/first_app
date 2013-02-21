class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :gender

      t.timestamps
    end

    add_index :categories, :name
    add_index :categories, [:name, :gender]
  end
end
