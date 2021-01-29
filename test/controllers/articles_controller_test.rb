require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "can create an article" do
    post "/api/articles",
     params: { article: {id: 1, title: "Test", body: "can create an article", status: "public"}}
     assert_response :success
  end
end
