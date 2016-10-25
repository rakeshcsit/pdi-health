class RdsController < ApplicationController
  before_action :set_rd, only: [:show, :edit, :update, :destroy]

  # GET /rds
  # GET /rds.json
  def index
    @rds = Rd.all
  end

  # GET /rds/1
  # GET /rds/1.json
  def show
  end

  # GET /rds/new
  def new
    @rd = Rd.new
  end

  # GET /rds/1/edit
  def edit
  end

  # POST /rds
  # POST /rds.json
  def create
    @rd = Rd.new(rd_params)

    respond_to do |format|
      if @rd.save
        format.html { redirect_to @rd, notice: 'Rd was successfully created.' }
        format.json { render :show, status: :created, location: @rd }
      else
        format.html { render :new }
        format.json { render json: @rd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rds/1
  # PATCH/PUT /rds/1.json
  def update
    respond_to do |format|
      if @rd.update(rd_params)
        format.html { redirect_to @rd, notice: 'Rd was successfully updated.' }
        format.json { render :show, status: :ok, location: @rd }
      else
        format.html { render :edit }
        format.json { render json: @rd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rds/1
  # DELETE /rds/1.json
  def destroy
    @rd.destroy
    respond_to do |format|
      format.html { redirect_to rds_url, notice: 'Rd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rd
      @rd = Rd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rd_params
      params.require(:rd).permit(:rd, :rd_email)
    end
end
