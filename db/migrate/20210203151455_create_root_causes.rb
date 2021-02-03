class CreateRootCauses < ActiveRecord::Migration[6.1]
  def change
    create_table :root_causes do |t|
      
      t.string :name

      t.timestamps
    end
  end
end
