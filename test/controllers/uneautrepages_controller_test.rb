require 'test_helper'

class UneautrepagesControllerTest < ActionController::TestCase
  setup do
    @uneautrepage = uneautrepages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uneautrepages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uneautrepage" do
    assert_difference('Uneautrepage.count') do
      post :create, uneautrepage: { civilite: @uneautrepage.civilite, nom: @uneautrepage.nom, prenom: @uneautrepage.prenom }
    end

    assert_redirected_to uneautrepage_path(assigns(:uneautrepage))
  end

  test "should show uneautrepage" do
    get :show, id: @uneautrepage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uneautrepage
    assert_response :success
  end

  test "should update uneautrepage" do
    patch :update, id: @uneautrepage, uneautrepage: { civilite: @uneautrepage.civilite, nom: @uneautrepage.nom, prenom: @uneautrepage.prenom }
    assert_redirected_to uneautrepage_path(assigns(:uneautrepage))
  end

  test "should destroy uneautrepage" do
    assert_difference('Uneautrepage.count', -1) do
      delete :destroy, id: @uneautrepage
    end

    assert_redirected_to uneautrepages_path
  end
end
