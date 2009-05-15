require File.dirname(__FILE__) + '/../test_helper'

class KbcatsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:kbcats)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_kbcat
    assert_difference('Kbcat.count') do
      post :create, :kbcat => { }
    end

    assert_redirected_to kbcat_path(assigns(:kbcat))
  end

  def test_should_show_kbcat
    get :show, :id => kbcats(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => kbcats(:one).id
    assert_response :success
  end

  def test_should_update_kbcat
    put :update, :id => kbcats(:one).id, :kbcat => { }
    assert_redirected_to kbcat_path(assigns(:kbcat))
  end

  def test_should_destroy_kbcat
    assert_difference('Kbcat.count', -1) do
      delete :destroy, :id => kbcats(:one).id
    end

    assert_redirected_to kbcats_path
  end
end
