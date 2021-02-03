class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.integer :response_id
      t.integer :option_id
      
      t.timestamps
    end

    add_foreign_key :choices, :responses
    add_foreign_key :choices, :options
  end
end
