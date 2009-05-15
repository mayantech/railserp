require File.dirname(__FILE__) + '/../test_helper'

class FiledatasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:filedatas)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_filedata
    assert_difference('Filedata.count') do
      post :create, :filedata => { }
    end

    assert_redirected_to filedata_path(assigns(:filedata))
  end

  def test_should_show_filedata
    get :show, :id => filedatas(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => filedatas(:one).id
    assert_response :success
  end

  def test_should_update_filedata
    put :update, :id => filedatas(:one).id, :filedata => { }
    assert_redirected_to filedata_path(assigns(:filedata))
  end

  def test_should_destroy_filedata
    assert_difference('Filedata.count', -1) do
      delete :destroy, :id => filedatas(:one).id
    end

    assert_redirected_to filedatas_path
  end
end
