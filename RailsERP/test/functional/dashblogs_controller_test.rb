require File.dirname(__FILE__) + '/../test_helper'

class DashblogsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:dashblogs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_dashblog
    assert_difference('Dashblog.count') do
      post :create, :dashblog => { }
    end

    assert_redirected_to dashblog_path(assigns(:dashblog))
  end

  def test_should_show_dashblog
    get :show, :id => dashblogs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => dashblogs(:one).id
    assert_response :success
  end

  def test_should_update_dashblog
    put :update, :id => dashblogs(:one).id, :dashblog => { }
    assert_redirected_to dashblog_path(assigns(:dashblog))
  end

  def test_should_destroy_dashblog
    assert_difference('Dashblog.count', -1) do
      delete :destroy, :id => dashblogs(:one).id
    end

    assert_redirected_to dashblogs_path
  end
end
