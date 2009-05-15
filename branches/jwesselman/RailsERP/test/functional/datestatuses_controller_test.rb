require File.dirname(__FILE__) + '/../test_helper'

class DatestatusesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:datestatuses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_datestatus
    assert_difference('Datestatus.count') do
      post :create, :datestatus => { }
    end

    assert_redirected_to datestatus_path(assigns(:datestatus))
  end

  def test_should_show_datestatus
    get :show, :id => datestatuses(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => datestatuses(:one).id
    assert_response :success
  end

  def test_should_update_datestatus
    put :update, :id => datestatuses(:one).id, :datestatus => { }
    assert_redirected_to datestatus_path(assigns(:datestatus))
  end

  def test_should_destroy_datestatus
    assert_difference('Datestatus.count', -1) do
      delete :destroy, :id => datestatuses(:one).id
    end

    assert_redirected_to datestatuses_path
  end
end
