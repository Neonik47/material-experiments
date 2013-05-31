require 'test_helper'

class ExperimentsImpactsParamsControllerTest < ActionController::TestCase
  setup do
    @experiments_impacts_param = experiments_impacts_params(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiments_impacts_params)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiments_impacts_param" do
    assert_difference('ExperimentsImpactsParam.count') do
      post :create, experiments_impacts_param: @experiments_impacts_param.attributes
    end

    assert_redirected_to experiments_impacts_param_path(assigns(:experiments_impacts_param))
  end

  test "should show experiments_impacts_param" do
    get :show, id: @experiments_impacts_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experiments_impacts_param
    assert_response :success
  end

  test "should update experiments_impacts_param" do
    put :update, id: @experiments_impacts_param, experiments_impacts_param: @experiments_impacts_param.attributes
    assert_redirected_to experiments_impacts_param_path(assigns(:experiments_impacts_param))
  end

  test "should destroy experiments_impacts_param" do
    assert_difference('ExperimentsImpactsParam.count', -1) do
      delete :destroy, id: @experiments_impacts_param
    end

    assert_redirected_to experiments_impacts_params_path
  end
end
