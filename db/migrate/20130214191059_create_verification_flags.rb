class CreateVerificationFlags < ActiveRecord::Migration
  def change
    create_table :verification_flags do |t|
      t.belongs_to :measurement
      t.string :point

      t.timestamps
    end
    add_index :verification_flags, :measurement_id
  end
end
