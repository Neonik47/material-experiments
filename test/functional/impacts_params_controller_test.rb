require 'test_helper'

class ImpactsParamsControllerTest < ActionController::TestCase
  setup do
    @impacts_param = impacts_params(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:impacts_params)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create impacts_param" do
    assert_difference('ImpactsParam.count') do
      post :create, impacts_param: @impacts_param.attributes
    end

    assert_redirected_to impacts_param_path(assigns(:impacts_param))
  end

  test "should show impacts_param" do
    get :show, id: @impacts_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @impacts_param
    assert_response :success
  end

  test "should update impacts_param" do
    put :update, id: @impacts_param, impacts_param: @impacts_param.attributes
    assert_redirected_to impacts_param_path(assigns(:impacts_param))
  end

  test "should destroy impacts_param" do
    assert_difference('ImpactsParam.count', -1) do
      delete :destroy, id: @impacts_param
    end

    assert_redirected_to impacts_params_path
  end
end
