# == Schema Information
#
# Table name: styles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Style < ApplicationRecord
  has_many :questions
  
  validates :name, :presence => true
end
