class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.belongs_to :size_type
      t.string :value
      t.integer :position

      t.timestamps
    end
    add_index :sizes, :size_type_id
  end
end
