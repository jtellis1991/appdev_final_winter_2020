class UpdateResponseToIncludeInputs < ActiveRecord::Migration[6.1]
  def change
  remove_column :responses, :text_submitted, :text
  add_column :responses, :first, :string  
  add_column :responses, :second, :string  
  add_column :responses, :third,  :string
  add_column :responses, :fourth, :string
    
  end
end
