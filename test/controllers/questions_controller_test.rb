require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  
  def setup 
    @question = questions(:one)
  end
 
  test "fixtures are valid" do
    questions.each do |question|
      assert question.valid?, question.errors.full_messages.inspect
    end
  end
 
  test "prompt presence not valid" do
    @question.prompt = nil
    assert_not @question.valid?
    @question.prompt = "       "
    assert_not @question.valid?
  end
  
   test "answer_value presence not valid" do
    @question.answer_value = nil
    assert_not @question.valid?
    @question.answer_value = "       "
    assert_not @question.valid?
  end
  
  test "answer_explanation presence not valid" do
    @question.answer_explanation = nil
    assert_not @question.valid?
    @question.answer_explanation = "       "
    assert_not @question.valid?
  end
  
   test "A, B, C, D presence not valid" do
    @question.A = nil
    assert_not @question.valid?
    @question.A = "       "
    assert_not @question.valid?
    @question.A = "A"
    assert @question.valid?
    @question.B = nil
    assert_not @question.valid?
    @question.B = "       "
    assert_not @question.valid?
    @question.B = "B"
    assert @question.valid?
    @question.C = nil
    assert_not @question.valid?
    @question.C = "       "
    assert_not @question.valid?
    @question.C = "C"
    assert @question.valid?
    @question.D = nil
    assert_not @question.valid?
    @question.D = "       "
    assert_not @question.valid?
    @question.D = "D"
    assert @question.valid?
  end
 
   test "question_id presence not valid" do
    @question.question_id = nil
    assert_not @question.valid?
    @question.question_id = "       "
    assert_not @question.valid?
  end
 
  test "question (prompts) should be unique" do
    q = @question.dup
    assert_not q.valid?
  end
  
  test "choices that are duplicate are invalid" do
    @question.A = @question.B
    assert_not @question.valid?, @question.errors.full_messages.inspect
  end
 
  test "should get index" do
    get questions_url
    assert_response :success
  end

  test "should get show" do
    get question_url(@question)
    assert_response :success
  end
end
