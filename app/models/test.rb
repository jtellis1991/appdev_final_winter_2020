# == Schema Information
#
# Table name: tests
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Test < ApplicationRecord
  has_many :questions
  has_many :test_attempts
  belongs_to :testable, polymorphic: true
  
end
