class CreateImplementations < ActiveRecord::Migration[6.1]
  def change
    create_table :implementations do |t|
      
      t.integer :question_id
      t.integer :strategy_id

      t.timestamps
    end
    
    add_foreign_key :implementations, :questions
    add_foreign_key :implementations, :strategies
  end
end
