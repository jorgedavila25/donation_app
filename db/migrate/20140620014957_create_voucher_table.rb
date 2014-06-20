class CreateVoucherTable < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.date :expiration_date
      t.string :name

      t.timestamps
    end
  end
end
