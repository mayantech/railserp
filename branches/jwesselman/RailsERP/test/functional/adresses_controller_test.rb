require File.dirname(__FILE__) + '/../test_helper'

class AdressesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:adresses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_adress
    assert_difference('Adress.count') do
      post :create, :adress => { }
    end

    assert_redirected_to adress_path(assigns(:adress))
  end

  def test_should_show_adress
    get :show, :id => adresses(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => adresses(:one).id
    assert_response :success
  end

  def test_should_update_adress
    put :update, :id => adresses(:one).id, :adress => { }
    assert_redirected_to adress_path(assigns(:adress))
  end

  def test_should_destroy_adress
    assert_difference('Adress.count', -1) do
      delete :destroy, :id => adresses(:one).id
    end

    assert_redirected_to adresses_path
  end
end
