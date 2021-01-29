require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without commenter" do
    comment = Comment.new
    assert_not comment.save, "Saved the comments without a commenter"
  end
  test "comments count" do
    assert_equal 2, Comment.count
  end
end
