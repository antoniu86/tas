require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "should get secret" do
    FactoryBot.define do
      factory :user do
        first_name { "User1" }
        last_name { "UserLastName" }
        birthdate { "1986-02-10" }
        email { "test@example.com" }
        password { "012345" }
      end
    end

    sign_in FactoryBot.create(:user)

    get :secret
    assert_response :success
  end

  test "should not get secret fail 1" do
    get :secret
    assert_response :success
  end

  test "should not get secret fail 2" do
    get :secret
    assert_response :error
  end

  test "should redirect" do
    get :secret
    assert_response :redirect
  end
end
