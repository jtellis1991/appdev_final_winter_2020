class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :prompt
      # t.references :student, null: false, foreign_key: true
      t.string :question_id
      t.string :A
      t.string :B
      t.string :C
      t.string :D
      t.string :answer_value
      t.text :answer_explanation
      # t.string :choice

      t.timestamps
    end
  end
end
