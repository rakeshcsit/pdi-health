class TiersController < ApplicationController
  before_action :set_tier, only: [:show, :edit, :update, :destroy]

  # GET /tiers
  # GET /tiers.json
  def index
    @tiers = Tier.all
  end

  # GET /tiers/1
  # GET /tiers/1.json
  def show
  end

  # GET /tiers/new
  def new
    @tier = Tier.new
  end

  # GET /tiers/1/edit
  def edit
  end

  # POST /tiers
  # POST /tiers.json
  def create
    @tier = Tier.new(tier_params)

    respond_to do |format|
      if @tier.save
        format.html { redirect_to @tier, notice: 'Tier was successfully created.' }
        format.json { render :show, status: :created, location: @tier }
      else
        format.html { render :new }
        format.json { render json: @tier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiers/1
  # PATCH/PUT /tiers/1.json
  def update
    respond_to do |format|
      if @tier.update(tier_params)
        format.html { redirect_to @tier, notice: 'Tier was successfully updated.' }
        format.json { render :show, status: :ok, location: @tier }
      else
        format.html { render :edit }
        format.json { render json: @tier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiers/1
  # DELETE /tiers/1.json
  def destroy
    @tier.destroy
    respond_to do |format|
      format.html { redirect_to tiers_url, notice: 'Tier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tier
      @tier = Tier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tier_params
      params.require(:tier).permit(:tier, :notes)
    end
end
