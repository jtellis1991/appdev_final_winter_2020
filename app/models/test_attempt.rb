# == Schema Information
#
# Table name: test_attempts
#
#  id         :integer          not null, primary key
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TestAttempt < ApplicationRecord
  has_many :responses
  belongs_to :user
  belongs_to :test
  
end
