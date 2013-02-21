class CreateSequenceFlags < ActiveRecord::Migration
  def change
    create_table :sequence_flags do |t|
      t.belongs_to :measurement_group
      t.string :point
      t.belongs_to :size

      t.timestamps
    end
    add_index :sequence_flags, :measurement_group_id
    add_index :sequence_flags, :size_id
  end
end
