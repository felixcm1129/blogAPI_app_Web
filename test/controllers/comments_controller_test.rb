require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  #Create
  test "can create a comment" do
    assert_difference 'Comment.count', 1 do
     post "/api/articles/1/comments",
      params: { comment: { commenter: "Test Dev", body: "can create a comment", status: "public"}}
    end
  end

  test "should not create a comment without a commenter" do 
    post "/api/articles/1/comments",
      params: {comment: {commenter: "", body: "can't create a comment without a commenter", status: "public"}}
      assert_response :unprocessable_entity
  end

  test "should not create a comment if the article doesn't exist. Cause an error" do
    post "/api/articles/3/comments",
      params: {comment: {commenter: "Dev", body: "can't create comment if article doesn't exist", status: "public"}}
  end

  #Delete
  test "should destroy comment" do
    assert_difference 'Comment.count', -1 do
      delete "/api/articles/1/comments/1"
    end
  end

  test "can't delete comment that doesn't exist. Should cause an error" do 
    delete "/api/articles/2/comments/3"
  end

  #Get Comment (Show)
  test "get comments with id = 1" do 
    get "/api/articles/1/comments/1"
    assert_response :success
  end

  test "can't get comments if it doesn't exist should pop an error" do
    get "/api/articles/1/comments/3"
  end

  #Get all comments (Index)
  test "get all comments from an article" do
    @article = Article.find(1).comments.count
    assert_equal 2, @article
  end

  test "can't get all comments from an non existing article. Should cause an error" do 
    get "/api/articles/3/comments"
  end

end
