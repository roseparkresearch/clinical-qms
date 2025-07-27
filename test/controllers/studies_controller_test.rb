require "test_helper"

class StudiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get studies_index_url
    assert_response :success
  end

  test "should get show" do
    get studies_show_url
    assert_response :success
  end

  test "should get new" do
    get studies_new_url
    assert_response :success
  end

  test "should get create" do
    get studies_create_url
    assert_response :success
  end

  test "should get edit" do
    get studies_edit_url
    assert_response :success
  end

  test "should get update" do
    get studies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get studies_destroy_url
    assert_response :success
  end
end
