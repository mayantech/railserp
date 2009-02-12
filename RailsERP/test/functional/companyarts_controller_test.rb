require File.dirname(__FILE__) + '/../test_helper'

class CompanyartsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:companyarts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_companyart
    assert_difference('Companyart.count') do
      post :create, :companyart => { }
    end

    assert_redirected_to companyart_path(assigns(:companyart))
  end

  def test_should_show_companyart
    get :show, :id => companyarts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => companyarts(:one).id
    assert_response :success
  end

  def test_should_update_companyart
    put :update, :id => companyarts(:one).id, :companyart => { }
    assert_redirected_to companyart_path(assigns(:companyart))
  end

  def test_should_destroy_companyart
    assert_difference('Companyart.count', -1) do
      delete :destroy, :id => companyarts(:one).id
    end

    assert_redirected_to companyarts_path
  end
end
