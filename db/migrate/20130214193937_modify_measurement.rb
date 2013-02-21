class ModifyMeasurement < ActiveRecord::Migration
  def up
    add_column :measurements, :measurement_group_id, :integer
    add_index :measurements, :measurement_group_id

    Measurement.all.each do |m|
      group = m.product.measurement_groups.create!(description: "Regular")
      m.measurement_group_id = group.id
      m.save
    end

    remove_column :measurements, :product_id
  end

  def down
    add_column :measurements, :product_id, :integer
    add_index :measurements, :product_id

    Measurement.all.each do |m|
      m.product_id = m.measurement_group.product.id
      m.save
    end

    remove_column :measurements, measurement_group_id
  end
end
