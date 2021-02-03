# == Schema Information
#
# Table name: options
#
#  id         :integer          not null, primary key
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Option < ApplicationRecord
  has_many :choices
  belongs_to :question
  
end
