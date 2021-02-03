class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.text :text_submitted
      t.integer :milliseconds_elapsed
      t.integer :user_id
      t.integer :question_id
      t.integer :test_attempt_id

      t.timestamps
    end
    
    add_foreign_key :responses, :users
    add_foreign_key :responses, :test_attempts
    add_foreign_key :responses, :questions
  end
end
