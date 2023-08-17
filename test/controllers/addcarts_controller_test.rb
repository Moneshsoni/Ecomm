require "test_helper"

class AddcartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get addcarts_index_url
    assert_response :success
  end
end
