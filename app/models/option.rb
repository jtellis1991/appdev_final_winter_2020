# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  correct     :boolean
#  value       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#
# Foreign Keys
#
#  question_id  (question_id => questions.id)
#
class Option < ApplicationRecord
  has_many :choices
  has_many :responses, through: :choices
  belongs_to :question
  
  validates :value, :presence => true
  validates :correct, inclusion: { in: [ true, false ] }
end
