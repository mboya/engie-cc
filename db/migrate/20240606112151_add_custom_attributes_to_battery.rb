class AddCustomAttributesToBattery < ActiveRecord::Migration[7.1]
  def change
    add_column :batteries, :custom_attributes, :text, default: '{}'
  end
end
