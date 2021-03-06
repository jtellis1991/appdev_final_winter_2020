# == Schema Information
#
# Table name: mistakes
#
#  id               :integer          not null, primary key
#  erroneous_answer :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  question_id      :integer
#  root_cause_id    :integer
#
# Foreign Keys
#
#  question_id    (question_id => questions.id)
#  root_cause_id  (root_cause_id => root_causes.id)
#
class Mistake < ApplicationRecord
  has_many :explanations, as: :explainable, dependent: :destroy
  belongs_to :root_cause
  belongs_to :question
  
  
end
