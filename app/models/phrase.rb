# == Schema Information
#
# Table name: phrases
#
#  id                :integer          not null, primary key
#  text_to_translate :text
#  translated_text   :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  question_id       :integer
#
# Foreign Keys
#
#  question_id  (question_id => questions.id)
#
class Phrase < ApplicationRecord
  belongs_to :question
  
  validates :text_to_translate, :translated_text, :presence => true
  
end
