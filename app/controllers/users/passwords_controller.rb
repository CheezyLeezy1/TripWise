# frozen_string_literal: true

module Users
  # Comment
  class PasswordsController < ApplicationController
    before_action :authenticate_user!
  end
end
