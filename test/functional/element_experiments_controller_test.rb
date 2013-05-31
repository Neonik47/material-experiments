require 'test_helper'

class ElementExperimentsControllerTest < ActionController::TestCase
  setup do
    @element_experiment = element_experiments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:element_experiments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create element_experiment" do
    assert_difference('ElementExperiment.count') do
      post :create, element_experiment: {  }
    end

    assert_redirected_to element_experiment_path(assigns(:element_experiment))
  end

  test "should show element_experiment" do
    get :show, id: @element_experiment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @element_experiment
    assert_response :success
  end

  test "should update element_experiment" do
    put :update, id: @element_experiment, element_experiment: {  }
    assert_redirected_to element_experiment_path(assigns(:element_experiment))
  end

  test "should destroy element_experiment" do
    assert_difference('ElementExperiment.count', -1) do
      delete :destroy, id: @element_experiment
    end

    assert_redirected_to element_experiments_path
  end
end
