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
  has_many :explanations, as: :explainable, dependent: :destroy
  belongs_to :question
  
  
end
