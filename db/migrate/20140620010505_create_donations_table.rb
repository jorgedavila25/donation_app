class CreateDonationsTable < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :title
      t.text :description
      t.references :donation_variation, polymorphic: true
      t.timestamps
    end
  end
end