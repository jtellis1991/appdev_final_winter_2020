# == Schema Information
#
# Table name: responses
#
#  id                   :integer          not null, primary key
#  correct              :boolean
#  first                :string
#  fourth               :string
#  milliseconds_elapsed :integer
#  second               :string
#  third                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  question_id          :integer
#  test_attempt_id      :integer
#  user_id              :integer
#
# Foreign Keys
#
#  question_id      (question_id => questions.id)
#  test_attempt_id  (test_attempt_id => test_attempts.id)
#  user_id          (user_id => users.id)
#
class Response < ApplicationRecord
  has_many :choices
  has_many :options, through: :choices
  belongs_to :user
  belongs_to :test_attempt
  belongs_to :question
  
  validates :milliseconds_elapsed, :presence => true
  validates :correct, inclusion: { in: [ true, false ] }
  
end
