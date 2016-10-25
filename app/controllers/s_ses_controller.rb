class SSesController < ApplicationController
  before_action :set_ss, only: [:show, :edit, :update, :destroy]

  # GET /sses
  # GET /sses.json
  def index
    @sses = Ss.all
  end

  # GET /sses/1
  # GET /sses/1.json
  def show
  end

  # GET /sses/new
  def new
    @ss = Ss.new
  end

  # GET /sses/1/edit
  def edit
  end

  # POST /sses
  # POST /sses.json
  def create
    @ss = Ss.new(ss_params)

    respond_to do |format|
      if @ss.save
        format.html { redirect_to @ss, notice: 'Ss was successfully created.' }
        format.json { render :show, status: :created, location: @ss }
      else
        format.html { render :new }
        format.json { render json: @ss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sses/1
  # PATCH/PUT /sses/1.json
  def update
    respond_to do |format|
      if @ss.update(ss_params)
        format.html { redirect_to @ss, notice: 'Ss was successfully updated.' }
        format.json { render :show, status: :ok, location: @ss }
      else
        format.html { render :edit }
        format.json { render json: @ss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sses/1
  # DELETE /sses/1.json
  def destroy
    @ss.destroy
    respond_to do |format|
      format.html { redirect_to sses_url, notice: 'Ss was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ss
      @ss = Ss.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ss_params
      params.require(:ss).permit(:university_id, :ss, :ss_email)
    end
end
