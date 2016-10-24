require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "users must have a unique uid and provider combination" do
        assert users(:grace).valid?
        assert users(:ada).valid?
        assert users(:no_tasks_user).valid?
    end

    test "only the first user with the same uid and provider combination is valid" do
        assert users(:grace).valid?

        grace_copy = User.new(uid: 12345, provider: "github")
        assert_not grace_copy.valid?
    end


end
