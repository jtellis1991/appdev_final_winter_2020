class UpdateResponses < ActiveRecord::Migration[6.1]
  def change
      change_table :responses do |t|
      t.remove :question_id, :letter, :correct
      t.integer :milliseconds_elapsed
      t.rename :answer, :text_submitted
    end
    
    
  end
end
