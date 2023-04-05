require "test_helper"

class FriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend = friends(:one)
  end

  test "should get index" do
    get friends_url, as: :json
    assert_response :success
  end

  test "should create friend" do
    assert_difference("Friend.count") do
      post friends_url, params: { friend: { birthdate: @friend.birthdate, first_name: @friend.first_name, last_name: @friend.last_name } }, as: :json
    end

    assert_response :created
  end

  test "should show friend" do
    get friend_url(@friend), as: :json
    assert_response :success
  end

  test "should update friend" do
    patch friend_url(@friend), params: { friend: { birthdate: @friend.birthdate, first_name: @friend.first_name, last_name: @friend.last_name } }, as: :json
    assert_response :success
  end

  test "should destroy friend" do
    assert_difference("Friend.count", -1) do
      delete friend_url(@friend), as: :json
    end

    assert_response :no_content
  end
end
