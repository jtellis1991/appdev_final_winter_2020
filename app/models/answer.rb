# == Schema Information
#
# Table name: answers
#
#  id             :integer          not null, primary key
#  correct_answer :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Answer < ApplicationRecord
end
