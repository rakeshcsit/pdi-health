class InrsController < ApplicationController
  before_action :set_inr, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @inrs = Inr.all
    respond_with(@inrs)
  end

  def show
    respond_with(@inr)
  end

  def new
    @inr = Inr.new
    respond_with(@inr)
  end

  def edit
  end

  def create
    @inr = Inr.new(inr_params)
    @inr.save
    respond_with(@inr)
  end

  def update
    @inr.update(inr_params)
    respond_with(@inr)
  end

  def destroy
    @inr.destroy
    respond_with(@inr)
  end

  private
    def set_inr
      @inr = Inr.find(params[:id])
    end

    def inr_params
      params.require(:inr).permit(:references, :value, :note, :wdate)
    end
end
