class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|

      t.string :size
      t.belongs_to :product
      t.belongs_to :admin_user
      t.string :status
      t.integer :position
      t.string :type

      t.decimal :waist
      t.decimal :front_rise
      t.decimal :back_rise
      t.decimal :hips
      t.decimal :opening
      t.decimal :thigh
      t.decimal :knee
      t.decimal :cuff
      t.decimal :inseam
      t.decimal :outseam
      t.decimal :collar
      t.decimal :chest
      t.decimal :hps_length
      t.decimal :cb_length
      t.decimal :shoulder
      t.decimal :sleeve_length
      t.decimal :arm_hole
      t.decimal :sleeve_width

      t.timestamps
    end

    add_index :measurements, :product_id
    add_index :measurements, :admin_user_id
  end
end
