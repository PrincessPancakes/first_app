class CreateClosetItems < ActiveRecord::Migration
  def change
    create_table :closet_items do |t|
      t.belongs_to :item
      t.belongs_to :user

      t.timestamps
    end
    add_index :closet_items, :item_id
    add_index :closet_items, :user_id
  end
end
