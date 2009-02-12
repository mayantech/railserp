require File.dirname(__FILE__) + '/../test_helper'

class CaldatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:caldates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_caldate
    assert_difference('Caldate.count') do
      post :create, :caldate => { }
    end

    assert_redirected_to caldate_path(assigns(:caldate))
  end

  def test_should_show_caldate
    get :show, :id => caldates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => caldates(:one).id
    assert_response :success
  end

  def test_should_update_caldate
    put :update, :id => caldates(:one).id, :caldate => { }
    assert_redirected_to caldate_path(assigns(:caldate))
  end

  def test_should_destroy_caldate
    assert_difference('Caldate.count', -1) do
      delete :destroy, :id => caldates(:one).id
    end

    assert_redirected_to caldates_path
  end
end
