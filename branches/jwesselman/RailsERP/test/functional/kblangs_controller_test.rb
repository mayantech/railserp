require File.dirname(__FILE__) + '/../test_helper'

class KblangsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:kblangs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_kblang
    assert_difference('Kblang.count') do
      post :create, :kblang => { }
    end

    assert_redirected_to kblang_path(assigns(:kblang))
  end

  def test_should_show_kblang
    get :show, :id => kblangs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => kblangs(:one).id
    assert_response :success
  end

  def test_should_update_kblang
    put :update, :id => kblangs(:one).id, :kblang => { }
    assert_redirected_to kblang_path(assigns(:kblang))
  end

  def test_should_destroy_kblang
    assert_difference('Kblang.count', -1) do
      delete :destroy, :id => kblangs(:one).id
    end

    assert_redirected_to kblangs_path
  end
end
