class Api::V1::ApplicationController < ApplicationController
  layout 'api_v1'
  protect_from_forgery with: :null_session
end
