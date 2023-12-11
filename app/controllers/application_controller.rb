# frozen_string_literal: true

# Comment
class ApplicationController < ActionController::Base
  respond_to :html, :json
  include Devise::Controllers::Helpers
end
