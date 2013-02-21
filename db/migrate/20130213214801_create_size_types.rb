class CreateSizeTypes < ActiveRecord::Migration
  def change
    create_table :size_types do |t|
      t.string :name
      t.string :options

      t.timestamps
    end
  end
end
