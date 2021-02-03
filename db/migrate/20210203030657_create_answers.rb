class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :correct_answer
      t.integer :question_id

      t.timestamps
    end

    add_foreign_key :answers, :questions
  end
end
