class Admin::AdminController < ApplicationController
  layout 'admin'
  http_basic_authenticate_with name: "flashquest", password: "flashqu3st"

end
