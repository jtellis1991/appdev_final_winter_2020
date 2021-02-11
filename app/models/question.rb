# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  body        :text
#  difficulty  :integer
#  image       :string
#  prompt      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  official_id :string
#  style_id    :integer
#  test_id     :integer
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#  style_id     (style_id => styles.id)
#  test_id      (test_id => tests.id)
#
class Question < ApplicationRecord
  has_many :explanations, as: :explainable, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :options, dependent: :destroy
  has_many :phrases, dependent: :destroy
  has_many :mistakes, dependent: :destroy
  has_many :implementations, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :test
  belongs_to :category
  belongs_to :style
  
  validates :prompt, :body, :official_id, :difficulty, :presence => true
  # validates :prompt, uniqueness: true

end
