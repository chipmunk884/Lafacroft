require 'test_helper'

class Admin::PostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Admin::Post.count') do
      post :create, :post => { }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, :id => admin_posts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => admin_posts(:one).to_param
    assert_response :success
  end

  test "should update post" do
    put :update, :id => admin_posts(:one).to_param, :post => { }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Admin::Post.count', -1) do
      delete :destroy, :id => admin_posts(:one).to_param
    end

    assert_redirected_to admin_posts_path
  end
end
