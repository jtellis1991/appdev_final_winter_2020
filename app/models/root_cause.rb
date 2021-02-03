# == Schema Information
#
# Table name: root_causes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RootCause < ApplicationRecord
  has_many :explanations, as: :explainable, dependent: :destroy
  has_many :mistakes
  
  
end
