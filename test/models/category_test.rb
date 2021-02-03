# == Schema Information
#
# Table name: categories
#
#  id               :integer          not null, primary key
#  ancestry         :string
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  supercategory_id :integer
#
# Indexes
#
#  index_categories_on_ancestry          (ancestry)
#  index_categories_on_supercategory_id  (supercategory_id)
#
# Foreign Keys
#
#  supercategory_id  (supercategory_id => categories.id)
#
require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
