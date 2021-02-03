class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :value
      t.integer :question_id

      t.timestamps
    end

    add_foreign_key :options, :questions
  end
end
