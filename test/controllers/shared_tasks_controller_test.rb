require 'test_helper'

class SharedTasksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
