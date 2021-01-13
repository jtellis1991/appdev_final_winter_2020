# == Schema Information
#
# Table name: questions
#
#  id                 :integer          not null, primary key
#  A                  :string
#  B                  :string
#  C                  :string
#  D                  :string
#  answer_explanation :text
#  answer_value       :string
#  prompt             :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  question_id        :string
#
class Question < ApplicationRecord
  has_many :responses, dependent: :destroy, :inverse_of => :question
  accepts_nested_attributes_for :responses
  
  validates :prompt, :answer_value, :answer_explanation, :A, :B, :C, :D, 
  :question_id, presence: true
  validates :prompt, uniqueness: true
  validate :choices_canot_be_duplicate
  
  
  private 
  
      def choices_canot_be_duplicate
        if self.A == self.B
        errors.add(:A, "can't be the same as any other choice")
        end 
        if self.A == self.C
          errors.add(:A, "can't be the same as any other choice")
        end 
        if self.A == self.D
          errors.add(:A, "can't be the same as any other choice")
        end 
        if self.B == self.C
          errors.add(:B, "can't be the same as any other choice")
        end 
        if self.B == self.D
          errors.add(:B, "can't be the same as any other choice")
        end 
        if self.C == self.D
          errors.add(:C, "can't be the same as any other choice")
        end 
      end 
end
