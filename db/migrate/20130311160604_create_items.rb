class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :measurement
      t.belongs_to :style

      t.timestamps
    end
    add_index :items, :measurement_id
    add_index :items, :style_id
  end
end
