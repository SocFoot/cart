require 'test_helper'

class UpdateDateStoriesTest < ActionDispatch::IntegrationTest
  fixtures :users
  setup
  
  test "should be log in" do
    get "/login"
    post_via_redirect "/login" , name:"dave", password: 'secret'
    assert_response :success
    delete_via_redirect "/logout"
    
    get "/users/new"
    assert_redirected_to "/login"
    
    post "/users",  user: { password: 'secret', password_confirmation: 'secret' }
    assert_redirected_to "/login"
  end
  test "all" do
    get "/login"
    post_via_redirect "/login" , name:"dave", password: 'secret'
    assert_response :success

    user_id = session[:user_id]

    get "/users/#{user_id}/edit"
    assert_response :success
    assert_template "edit"
    
    order = orders(:ord)
    put_via_redirect order_url(order), {order: {ship_date:"2015-10-30 16:48:42"}}
    assert_response :success
  end
end
