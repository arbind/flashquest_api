class Admin::AdminController < ApplicationController
  layout 'admin'
  http_basic_authenticate_with name: "flashquest", password: "flashqu3st"
  before_action :bootstrap

private 

  def bootstrap
    @flash_quest_biz = Business.where(name: FLASHQUEST_BIZ_NAME).first
    @flash_quest_branch = @flash_quest_biz.branches.where(name: FLASHQUEST_BRANCH_NAME).first
  end
end
