class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.references :testable, polymorphic: true

      t.timestamps
    end
  end
end
