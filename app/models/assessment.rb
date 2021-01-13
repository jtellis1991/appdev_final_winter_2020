# == Schema Information
#
# Table name: assessments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Assessment < ApplicationRecord
  has_many :responses, dependent: :destroy, :inverse_of => :assessment
  accepts_nested_attributes_for :responses
end
