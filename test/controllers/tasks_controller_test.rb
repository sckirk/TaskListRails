require 'test_helper'

class TasksControllerTest < ActionController::TestCase
    # test "Logged in user can see only their tasks" do
    #     session[:user_id] = users(:grace).id
    #
    #     # Send the request, check the response
    #     get :index
    #     assert_response :success
    #     assert_template 'tasks/index'
    #
    #     # Check that tasks match exactly, that is:
    #     # - All tasks owned by this user are returned
    #     # - Tasks not owned by this user are not returned
    #     tasks_from_controller = assigns(:tasks)
    #     assert_equal(tasks_from_controller.length, users(:grace).tasks.length)
    #     tasks_from_controller.each do |task|
    #         assert_includes users(:grace).tasks, task
    #     end
    # end
    #
    # test "not-logged-in user will get redirected from tasks" do
    #     # Make sure no one is logged in:
    #     session.delete(:user_id)
    #
    #     get :index
    #     assert_response :redirect
    #     assert_redirected_to login_failure_path
    # end
end
