class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :correct_answer

      t.timestamps
    end
  end
end
