class Users::PasswordsController < ApplicationController
  before_action :authenticate_user!
end
