# == Schema Information
#
# Table name: tests
#
#  id            :integer          not null, primary key
#  name          :string
#  testable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  official_id   :string
#  testable_id   :integer
#
# Indexes
#
#  index_tests_on_testable  (testable_type,testable_id)
#
class Test < ApplicationRecord
  has_many :questions
  has_many :test_attempts
  belongs_to :testable, polymorphic: true, optional: true
  
  validates :name, :presence => true


end
