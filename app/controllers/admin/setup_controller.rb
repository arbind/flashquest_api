class Admin::SetupController < Admin::AdminController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]

  def index
    @branches = Branch.unscoped.order_by(:name.asc)
  end

  def new
    @branch = Branch.new
  end

  def create
    @branch = Branch.new(branch_params)

    if @branch.save
      biz = Business.create(name: @branch.name)
      biz.branches << @branch
      redirect_to admin_business_branch_quest_descriptions_path(@branch.business_id, @branch), notice: 'Branch was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    p branch_params
    p @branch
    if @branch.update_attributes(branch_params)
      p @branch
      redirect_to action: :index, notice: 'Branch was successfully updated.'
    else
      render action: 'edit'
    end
  end


  def destroy
    @branch.destroy
    redirect_to action: :index
  end

  private

    def set_branch
      @branch = Branch.unscoped.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(
        :name,
        :type,
        :url,
        :phone,
        :twitter_url,
        :facebook_url,
        :address,
        :address2,
        :city,
        :state,
        :zip,
        :neighborhood,
        :hidden,
      )
    end
end