class CreateStrategies < ActiveRecord::Migration[6.1]
  def change
    create_table :strategies do |t|
      
      t.string :name
      t.string :symbol

      t.timestamps
    end
  end
end
