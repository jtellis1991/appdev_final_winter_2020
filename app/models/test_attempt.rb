# == Schema Information
#
# Table name: test_attempts
#
#  id         :integer          not null, primary key
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  test_id    :integer
#  user_id    :integer
#
# Foreign Keys
#
#  test_id  (test_id => tests.id)
#  user_id  (user_id => users.id)
#
class TestAttempt < ApplicationRecord
  has_many :responses
  belongs_to :user
  belongs_to :test
  
end
