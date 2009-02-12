require File.dirname(__FILE__) + '/../test_helper'

class KbarticlesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:kbarticles)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_kbarticle
    assert_difference('Kbarticle.count') do
      post :create, :kbarticle => { }
    end

    assert_redirected_to kbarticle_path(assigns(:kbarticle))
  end

  def test_should_show_kbarticle
    get :show, :id => kbarticles(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => kbarticles(:one).id
    assert_response :success
  end

  def test_should_update_kbarticle
    put :update, :id => kbarticles(:one).id, :kbarticle => { }
    assert_redirected_to kbarticle_path(assigns(:kbarticle))
  end

  def test_should_destroy_kbarticle
    assert_difference('Kbarticle.count', -1) do
      delete :destroy, :id => kbarticles(:one).id
    end

    assert_redirected_to kbarticles_path
  end
end
