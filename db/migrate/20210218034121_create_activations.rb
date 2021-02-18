class CreateActivations < ActiveRecord::Migration[6.1]
  def change
    create_table :activations do |t|
      t.integer :user_id
      t.integer :strategy_id
      t.boolean :active
      
      t.timestamps
    end

    add_foreign_key :activations, :users
    add_foreign_key :activations, :strategies
  end
end
