class AddSizeIdToMeasurements < ActiveRecord::Migration
  def change
    add_column :measurements, :size_id, :integer

    add_index :measurements, :size_id
  end
end
