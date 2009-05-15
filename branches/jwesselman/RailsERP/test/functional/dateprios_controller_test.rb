require File.dirname(__FILE__) + '/../test_helper'

class DatepriosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:dateprios)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_dateprio
    assert_difference('Dateprio.count') do
      post :create, :dateprio => { }
    end

    assert_redirected_to dateprio_path(assigns(:dateprio))
  end

  def test_should_show_dateprio
    get :show, :id => dateprios(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => dateprios(:one).id
    assert_response :success
  end

  def test_should_update_dateprio
    put :update, :id => dateprios(:one).id, :dateprio => { }
    assert_redirected_to dateprio_path(assigns(:dateprio))
  end

  def test_should_destroy_dateprio
    assert_difference('Dateprio.count', -1) do
      delete :destroy, :id => dateprios(:one).id
    end

    assert_redirected_to dateprios_path
  end
end
