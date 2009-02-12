require File.dirname(__FILE__) + '/../test_helper'

class DatetasksControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:datetasks)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_datetask
    assert_difference('Datetask.count') do
      post :create, :datetask => { }
    end

    assert_redirected_to datetask_path(assigns(:datetask))
  end

  def test_should_show_datetask
    get :show, :id => datetasks(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => datetasks(:one).id
    assert_response :success
  end

  def test_should_update_datetask
    put :update, :id => datetasks(:one).id, :datetask => { }
    assert_redirected_to datetask_path(assigns(:datetask))
  end

  def test_should_destroy_datetask
    assert_difference('Datetask.count', -1) do
      delete :destroy, :id => datetasks(:one).id
    end

    assert_redirected_to datetasks_path
  end
end
