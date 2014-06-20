class AddNameToPhysicalItem < ActiveRecord::Migration
  def change
   add_column :physical_items, :name, :string
  end
end
