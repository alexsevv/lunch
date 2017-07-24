class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :soup_id
      t.integer :cereal_id
      t.integer :drink_id
      t.integer :user_id

      t.timestamps
    end
  end
end
