require "application_responder"

class Web::ApplicationController < ApplicationController
  protect_from_forgery with: :exception
end
