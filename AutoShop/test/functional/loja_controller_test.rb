require 'test_helper'

class LojaControllerTest < ActionController::TestCase
  test "should get principal" do
    get :principal
    assert_response :success
  end

end
