class CreateBatteries < ActiveRecord::Migration[7.1]
  def change
    create_table :batteries do |t|
      t.integer :capacity

      t.timestamps
    end
  end
end
