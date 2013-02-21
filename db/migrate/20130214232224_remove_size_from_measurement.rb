class RemoveSizeFromMeasurement < ActiveRecord::Migration
  def up
    remove_column :measurements, :size
  end

  def down
    add_column :measurements, :size, :string
  end
end
