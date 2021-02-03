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
  belongs_to :test_attempt
  belongs_to :question

  
end
