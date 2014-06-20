class CreatePhysicalItemTable < ActiveRecord::Migration
  def change
    create_table :physical_items do |t|
      t.integer :height
      t.integer :width
      t.float :weight

      t.timestamps
    end
  end
end
