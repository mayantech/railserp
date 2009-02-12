require File.dirname(__FILE__) + '/../test_helper'

class FoldersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:folders)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_folder
    assert_difference('Folder.count') do
      post :create, :folder => { }
    end

    assert_redirected_to folder_path(assigns(:folder))
  end

  def test_should_show_folder
    get :show, :id => folders(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => folders(:one).id
    assert_response :success
  end

  def test_should_update_folder
    put :update, :id => folders(:one).id, :folder => { }
    assert_redirected_to folder_path(assigns(:folder))
  end

  def test_should_destroy_folder
    assert_difference('Folder.count', -1) do
      delete :destroy, :id => folders(:one).id
    end

    assert_redirected_to folders_path
  end
end
