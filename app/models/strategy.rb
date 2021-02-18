# == Schema Information
#
# Table name: strategies
#
#  id         :integer          not null, primary key
#  name       :string
#  symbol     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Strategy < ApplicationRecord
  has_one :test, as: :testable
  has_many :explanations, as: :explainable, dependent: :destroy
  has_many :implementations
  has_many :activations
  has_many :users, through: :activations

end
