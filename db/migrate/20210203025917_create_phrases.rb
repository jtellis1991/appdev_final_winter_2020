class CreatePhrases < ActiveRecord::Migration[6.1]
  def change
    create_table :phrases do |t|
      t.text :text_to_translate
      t.text :translated_text
      t.integer :question_id

      t.timestamps
    end
    
    add_foreign_key :phrases, :questions
  end
end
