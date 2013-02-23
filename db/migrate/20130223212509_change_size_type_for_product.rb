class ChangeSizeTypeForProduct < ActiveRecord::Migration
  def up
    add_column :products, :size_type, :string
    remove_column :products, :size_type_id
  end

  def down
    add_column :products, :size_type_id, :integer
    remove_column :products, :size_type
  end
end
