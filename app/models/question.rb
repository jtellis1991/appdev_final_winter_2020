# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  body        :text
#  difficulty  :string
#  image       :string
#  prompt      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  official_id :string
#
class Question < ApplicationRecord
  has_many :responses, dependent: :destroy, :inverse_of => :question
  accepts_nested_attributes_for :responses
  
  # validates :prompt, :answer_value, :answer_explanation, :A, :B, :C, :D, 
  # :question_id, presence: true
  # validates :prompt, uniqueness: true
  # validate :choices_canot_be_duplicate
  
  # before_show :invalidate_cache

  # private 
  
  #     def choices_canot_be_duplicate
  #       if self.A == self.B
  #       errors.add(:A, "can't be the same as any other choice")
  #       end 
  #       if self.A == self.C
  #         errors.add(:A, "can't be the same as any other choice")
  #       end 
  #       if self.A == self.D
  #         errors.add(:A, "can't be the same as any other choice")
  #       end 
  #       if self.B == self.C
  #         errors.add(:B, "can't be the same as any other choice")
  #       end 
  #       if self.B == self.D
  #         errors.add(:B, "can't be the same as any other choice")
  #       end 
  #       if self.C == self.D
  #         errors.add(:C, "can't be the same as any other choice")
  #       end 
  #     end 
      
      # def invalidate_cache
      #   Rails.cache.delete("/users/#{self.id}")
      #   return true # recommended to return true, as Rails.cache.delete will return false if no cache is found and break the callback chain. 
      # end
  
      
end
