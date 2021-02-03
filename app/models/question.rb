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
  has_many :mistakes, dependent: :destroy
  has_many :implementations, dependent: :destroy
  has_one  :answer, dependent: :destroy
  belongs_to :test
  belongs_to :category
  
  # validates :prompt, :body
  # validates :prompt, uniqueness: true

end
