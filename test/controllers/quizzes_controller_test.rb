require "test_helper"

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quizzes_index_url
    assert_response :success
  end

  test "should get take" do
    get quizzes_take_url
    assert_response :success
  end

  test "should get submit" do
    get quizzes_submit_url
    assert_response :success
  end

  test "should get results" do
    get quizzes_results_url
    assert_response :success
  end
end
