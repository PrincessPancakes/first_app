class AddSizeTypeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :size_type_id, :integer
  end
end
