require 'test_helper'

class EmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ems_index_url
    assert_response :success
  end

end
