require 'test_helper'

class NspirefilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nspirefiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nspirefile" do
    assert_difference('Nspirefile.count') do
      post :create, :nspirefile => { }
    end

    assert_redirected_to nspirefile_path(assigns(:nspirefile))
  end

  test "should show nspirefile" do
    get :show, :id => nspirefiles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => nspirefiles(:one).to_param
    assert_response :success
  end

  test "should update nspirefile" do
    put :update, :id => nspirefiles(:one).to_param, :nspirefile => { }
    assert_redirected_to nspirefile_path(assigns(:nspirefile))
  end

  test "should destroy nspirefile" do
    assert_difference('Nspirefile.count', -1) do
      delete :destroy, :id => nspirefiles(:one).to_param
    end

    assert_redirected_to nspirefiles_path
  end
end
