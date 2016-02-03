require 'test_helper'

class ApiV1RoutingTest < ActionDispatch::IntegrationTest
  test "should go to v1 controller for /v1/ passed in URL" do
    assert_recognizes({:controller => "api/v1/domains", :action => "index", :apiv => "v1", :format => "json"}, "/api/v1/domains")
  end
end