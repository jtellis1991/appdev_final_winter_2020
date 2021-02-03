# == Schema Information
#
# Table name: implementations
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#  strategy_id :integer
#
# Foreign Keys
#
#  question_id  (question_id => questions.id)
#  strategy_id  (strategy_id => strategies.id)
#
class Implementation < ApplicationRecord
  belongs_to :strategy
  belongs_to :question
  
  
end
