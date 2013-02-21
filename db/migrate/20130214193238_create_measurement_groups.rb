class CreateMeasurementGroups < ActiveRecord::Migration
  def change
    create_table :measurement_groups do |t|
      t.belongs_to :product
      t.string :description

      t.timestamps
    end
    add_index :measurement_groups, :product_id
  end
end
