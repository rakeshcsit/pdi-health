class InrsController < ApplicationController
  before_action :set_inr, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @inrs = Inr.all#current_user.inrs
    
    inrs_this_month = current_user.inrs.where('wdate BETWEEN ? AND ?', Time.now.beginning_of_month, DateTime.now.end_of_month)

    inrs_month_len = inrs_this_month.length

    if inrs_month_len < 4
      @message = "You reported #{inrs_month_len} INRs this month. You should aim for 1 INR per week. Try your best to log #{4-inrs_month_len} INRs for the rest of the month."
    else
      @message = "You successfully logged 4 INRS this month! Great job. Keep reporting an INR each week."
    end

    # for chart
      inr_list = @inrs.pluck(:value)
      inr_date_list = @inrs.pluck(:wdate)

      chart_data = inr_date_list.each_with_index.map { |n, i| [n, inr_list[i]] }

      @chart_data = Hash[*chart_data.flatten]

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
