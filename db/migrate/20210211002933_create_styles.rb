class CreateStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :styles do |t|
      t.string :name

      t.timestamps
    end
    
  add_column :options, :correct, :boolean  
  add_column :responses, :correct, :boolean  
  add_column :questions, :style_id, :integer
  add_foreign_key :questions, :styles
    
  end
end
