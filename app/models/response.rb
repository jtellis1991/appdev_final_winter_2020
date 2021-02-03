# == Schema Information
#
# Table name: responses
#
#  id                   :integer          not null, primary key
#  milliseconds_elapsed :integer
#  text_submitted       :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Response < ApplicationRecord
  belongs_to :assessment, :inverse_of => :response
  accepts_nested_attributes_for :assessment
   
  belongs_to :question, :inverse_of => :response
  accepts_nested_attributes_for :question
  

  
end
