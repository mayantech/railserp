require File.dirname(__FILE__) + '/../test_helper'

class KbcommentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:kbcomments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_kbcomment
    assert_difference('Kbcomment.count') do
      post :create, :kbcomment => { }
    end

    assert_redirected_to kbcomment_path(assigns(:kbcomment))
  end

  def test_should_show_kbcomment
    get :show, :id => kbcomments(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => kbcomments(:one).id
    assert_response :success
  end

  def test_should_update_kbcomment
    put :update, :id => kbcomments(:one).id, :kbcomment => { }
    assert_redirected_to kbcomment_path(assigns(:kbcomment))
  end

  def test_should_destroy_kbcomment
    assert_difference('Kbcomment.count', -1) do
      delete :destroy, :id => kbcomments(:one).id
    end

    assert_redirected_to kbcomments_path
  end
end
