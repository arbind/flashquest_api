class BusinessesController < ApplicationController
  before_action :set_business, only: [:patrons, :branches, :quests, :rewards, :photo_quests, :review_quests, :activity, :show, :edit, :update, :destroy]

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
  end

  # GET /businesses/1/patrons
  # GET /businesses/1/patrons.json
  def patrons
  end

  # GET /businesses/1/quests
  # GET /businesses/1/quests.json
  def quests
    @quests = @business.quests
    @quests = @quests.where(type: params[:type].to_sym) if params[:type]
  end

  # GET /businesses/1/photo_quests
  # GET /businesses/1/photo_quests.json
  def photo_quests
    @quests = @business.quests.where(type: :photo)
    render :quests
  end

  # GET /businesses/1/review_quests
  # GET /businesses/1/review_quests.json
  def review_quests
    @quests = @business.quests.where(type: :review)
    render :quests
  end

  # GET /businesses/1/rewards
  # GET /businesses/1/rewards.json
  def rewards
  end

  # GET /businesses/1/activity
  # GET /businesses/1/activity.json
  def activity
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render action: 'show', status: :created, location: @business }
      else
        format.html { render action: 'new' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name)
    end
end
