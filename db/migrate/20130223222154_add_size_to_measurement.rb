class AddSizeToMeasurement < ActiveRecord::Migration
  def change
    add_column :measurements, :size, :string
  end
end
