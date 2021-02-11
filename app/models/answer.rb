# == Schema Information
#
# Table name: answers
#
#  id             :integer          not null, primary key
#  correct_answer :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  question_id    :integer
#
# Foreign Keys
#
#  question_id  (question_id => questions.id)
#
class Answer < ApplicationRecord
  belongs_to :question
  
  validates :correct_answer, :presence => true

end
