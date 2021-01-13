class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.string :question_id
      t.string :letter
      t.string :answer
      t.boolean :correct

      t.timestamps
    end
  end
end
