require 'test_helper'

class PostAnimesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_animes_new_url
    assert_response :success
  end

  test "should get index" do
    get post_animes_index_url
    assert_response :success
  end

  test "should get show" do
    get post_animes_show_url
    assert_response :success
  end

  test "should get create" do
    get post_animes_create_url
    assert_response :success
  end

  test "should get edit" do
    get post_animes_edit_url
    assert_response :success
  end

  test "should get update" do
    get post_animes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get post_animes_destroy_url
    assert_response :success
  end

end
