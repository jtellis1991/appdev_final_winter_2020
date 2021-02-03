class CreateMistakes < ActiveRecord::Migration[6.1]
  def change
    create_table :mistakes do |t|
      
      t.text :erroneous_answer
      t.integer :question_id
      t.integer :root_cause_id

      t.timestamps
    end
  end
end
