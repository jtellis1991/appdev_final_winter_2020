class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body
      t.text :prompt
      t.string :official_id
      t.string :image
      t.integer :difficulty
      t.integer :test_id
      t.integer :category_id
      
      t.timestamps
    end
    
    add_foreign_key :questions, :tests
    add_foreign_key :questions, :categories
  end
end
