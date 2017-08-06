class EmsController < ApplicationController
  def index
    @ems = Ems.new()
    @ems.area = params[:area]
    @ems.weight = params[:weight]
    if @ems.valid?
      render json: @ems.render_response
    else
      render json: @ems.render_error_response, status: 500
    end
  end
end
