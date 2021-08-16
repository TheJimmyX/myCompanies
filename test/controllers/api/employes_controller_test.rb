require "test_helper"

class Api::EmployesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_employes_index_url
    assert_response :success
  end

  test "should get show" do
    get api_employes_show_url
    assert_response :success
  end
end
