require File.dirname(__FILE__) + '/../test_helper'

class DateartsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:datearts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_dateart
    assert_difference('Dateart.count') do
      post :create, :dateart => { }
    end

    assert_redirected_to dateart_path(assigns(:dateart))
  end

  def test_should_show_dateart
    get :show, :id => datearts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => datearts(:one).id
    assert_response :success
  end

  def test_should_update_dateart
    put :update, :id => datearts(:one).id, :dateart => { }
    assert_redirected_to dateart_path(assigns(:dateart))
  end

  def test_should_destroy_dateart
    assert_difference('Dateart.count', -1) do
      delete :destroy, :id => datearts(:one).id
    end

    assert_redirected_to datearts_path
  end
end
