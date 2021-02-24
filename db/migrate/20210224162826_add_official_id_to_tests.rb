class AddOfficialIdToTests < ActiveRecord::Migration[6.1]
  def change
  add_column :tests, :official_id, :string
  end
end
