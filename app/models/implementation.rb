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
class Implementation < ApplicationRecord
  belongs_to :strategy
  belongs_to :question
  
  
end
