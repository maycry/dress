require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @product.id
    assert_response :success
  end
end
