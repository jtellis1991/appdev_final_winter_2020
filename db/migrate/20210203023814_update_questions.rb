class UpdateQuestions < ActiveRecord::Migration[6.1]
  def change
    change_table :questions do |t|
      t.remove :A, :B, :C, :D, :answer_explanation, :answer_value
      t.string :difficulty
      t.text :body
      t.string :image
      t.rename :question_id, :official_id
      
    end
    
      add_reference :tests, foreign_key: true
  end
end
