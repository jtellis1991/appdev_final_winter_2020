# == Schema Information
#
# Table name: phrases
#
#  id                :integer          not null, primary key
#  text_to_translate :text
#  translated_text   :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class PhraseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
