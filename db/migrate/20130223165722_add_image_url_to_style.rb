class AddImageUrlToStyle < ActiveRecord::Migration
  def change
    add_column :styles, :image_url, :string
  end
end
