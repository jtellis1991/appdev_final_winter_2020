class CreateExplanations < ActiveRecord::Migration[6.1]
  def change
    create_table :explanations do |t|
      
      t.integer :position
      t.text :image
      t.text :description
      
      t.references :explainable, polymorphic: true

      t.timestamps
    end
  end
end
