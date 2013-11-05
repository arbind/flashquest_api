class Admin::QuestDescriptionsController < Admin::AdminController
  before_action :set_context

  def index
  end

  def new
    @quest_type =  params[:quest_type] || :photo
    @quest_description = @branch.quest_descriptions.build
  end

  def edit
    @quest_description = @branch.quest_descriptions.find(params[:id])
  end

  def create
    @quest_description = @branch.quest_descriptions.create! quest_description_params
    redirect_to action: :index
  end

  def update
    @quest_description.update_attributes! quest_description_params
    redirect_to action: :index
  end

  def destroy
    @branch.quest_descriptions.find(params[:id]).delete
    redirect_to action: :index
  end

  private

  def set_context
    @biz = Business.unscoped.find(params[:business_id])
    @branch = @biz.branches.unscoped.find(params[:branch_id])
    @photo_quest_descriptions = @branch.quest_descriptions.photo
    @comment_quest_descriptions = @branch.quest_descriptions.comment
    @quest_description = @branch.quest_descriptions.find(params[:id]) if params[:id]
  end

  def quest_description_params
    params.require(:quest_description).permit(
      :active,
      :type,
      :name,
      :description,
      :points,
      :approvals_required_for_points,
      # :bonus_approval_points,
      # :bonus_sharing_points,
      # :approvals_required_for_bonus
    )
  end
end
