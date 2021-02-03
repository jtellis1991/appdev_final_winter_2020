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
  has_many :responses, dependent: :destroy
  has_many :options, dependent: :destroy
  has_many :phrases, dependent: :destroy
  has_one  :test
  
  belongs_to :test
  
  # validates :prompt, :body
  # validates :prompt, uniqueness: true

end
