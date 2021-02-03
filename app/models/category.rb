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
class Category < ApplicationRecord
  has_ancestry
  has_many :tests, as: :testable
  has_many :explanations, as: :explainable, dependent: :destroy
  has_many :questions
  
end
