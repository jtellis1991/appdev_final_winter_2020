# == Schema Information
#
# Table name: activations
#
#  id          :integer          not null, primary key
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  strategy_id :integer
#  user_id     :integer
#
# Foreign Keys
#
#  strategy_id  (strategy_id => strategies.id)
#  user_id      (user_id => users.id)
#
class Activation < ApplicationRecord
  belongs_to :user
  belongs_to :strategy
  
end
