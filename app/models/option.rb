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
  belongs_to :question
  
  validates :correct, :value, :presence => true
  
end
