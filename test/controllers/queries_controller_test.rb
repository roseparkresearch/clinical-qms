require "test_helper"

class QueriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get queries_index_url
    assert_response :success
  end

  test "should get show" do
    get queries_show_url
    assert_response :success
  end

  test "should get new" do
    get queries_new_url
    assert_response :success
  end

  test "should get create" do
    get queries_create_url
    assert_response :success
  end

  test "should get edit" do
    get queries_edit_url
    assert_response :success
  end

  test "should get update" do
    get queries_update_url
    assert_response :success
  end

  test "should get destroy" do
    get queries_destroy_url
    assert_response :success
  end
end
