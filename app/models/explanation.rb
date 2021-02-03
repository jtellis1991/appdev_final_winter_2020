# == Schema Information
#
# Table name: explanations
#
#  id               :integer          not null, primary key
#  description      :text
#  explainable_type :string
#  image            :text
#  position         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  explainable_id   :integer
#
# Indexes
#
#  index_explanations_on_explainable  (explainable_type,explainable_id)
#
class Explanation < ApplicationRecord
  belongs_to :explainable, polymorphic: true
  
end
