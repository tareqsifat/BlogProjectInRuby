require "test_helper"

class SubCategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sub_category_index_url
    assert_response :success
  end

  test "should get create" do
    get sub_category_create_url
    assert_response :success
  end

  test "should get update" do
    get sub_category_update_url
    assert_response :success
  end

  test "should get show" do
    get sub_category_show_url
    assert_response :success
  end

  test "should get delete" do
    get sub_category_delete_url
    assert_response :success
  end
end
