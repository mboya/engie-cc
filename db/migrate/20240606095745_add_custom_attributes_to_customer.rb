class AddCustomAttributesToCustomer < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :custom_attributes, :text, default: '{}'
  end
end
