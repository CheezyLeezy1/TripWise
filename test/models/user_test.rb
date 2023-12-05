# frozen_string_literal: true
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:john_doe)
    @invalid_user = users(:invalid_user)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid user' do
    refute @invalid_user.valid?
    assert_not_nil @invalid_user.errors[:email], 'no validation error for email present'
  end

  test 'invalid with duplicate email' do
    duplicate_user = @user.dup
    @user.save
    refute duplicate_user.valid?, 'user is valid with a duplicate email'
  end

  test 'invalid with incorrect email format' do
    @user.email = 'invalid_email_format'
    refute @user.valid?, 'user is valid with an incorrect email format'
    assert_not_nil @user.errors[:email], 'no validation error for email format present'
  end
end

