class TierUpdatesController < ApplicationController
  before_action :set_tier_update, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :check_if_admin, only: [:edit, :update, :destroy]

  # GET /tier_updates
  # GET /tier_updates.json
  def index
    @tier_updates = TierUpdate.all
  end

  # GET /tier_updates/1
  # GET /tier_updates/1.json
  def show
  end

  # GET /tier_updates/new
  def new
    @tier_update = TierUpdate.new
  end

  # GET /tier_updates/1/edit
  def edit
  end

  # PATCH/PUT /tier_updates/1
  # PATCH/PUT /tier_updates/1.json
  def update
    respond_to do |format|
      if @tier_update.update(tier_update_params)
        format.html { redirect_to @tier_update, notice: 'Tier update was successfully updated.' }
        format.json { render :show, status: :ok, location: @tier_update }
      else
        format.html { render :edit }
        format.json { render json: @tier_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tier_updates/1
  # DELETE /tier_updates/1.json
  def destroy
    @tier_update.destroy
    respond_to do |format|
      format.html { redirect_to tier_updates_url, notice: 'Tier update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tier_update
      @tier_update = TierUpdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tier_update_params
      params.require(:tier_update).permit(:instructor_id, :old_tier, :new_tier, :notes)
    end
end
