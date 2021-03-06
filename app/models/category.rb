# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  ancestry   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_ancestry  (ancestry)
#
class Category < ApplicationRecord
  has_ancestry
  has_many :tests, as: :testable
  has_many :explanations, as: :explainable, dependent: :destroy
  has_many :questions
  
  validates :name, :presence => true
  
end
