class CreateTestAttempts < ActiveRecord::Migration[6.1]
  def change
    create_table :test_attempts do |t|
      t.integer :score
      t.integer :user_id
      t.integer :test_id

      t.timestamps
    end
    
    add_foreign_key :test_attempts, :users
    add_foreign_key :test_attempts, :tests
  end
end
