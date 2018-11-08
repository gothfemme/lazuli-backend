require 'test_helper'

class ReblogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reblog = reblogs(:one)
  end

  test "should get index" do
    get reblogs_url, as: :json
    assert_response :success
  end

  test "should create reblog" do
    assert_difference('Reblog.count') do
      post reblogs_url, params: { reblog: { post_id: @reblog.post_id, user_id: @reblog.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show reblog" do
    get reblog_url(@reblog), as: :json
    assert_response :success
  end

  test "should update reblog" do
    patch reblog_url(@reblog), params: { reblog: { post_id: @reblog.post_id, user_id: @reblog.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy reblog" do
    assert_difference('Reblog.count', -1) do
      delete reblog_url(@reblog), as: :json
    end

    assert_response 204
  end
end
