class ErrorsController < ApplicationController
  def index
    @q = Error.ransack(params[:q])
    @errors = @q.result.page(params[:page])
  end

  def new
    @error = Error.new
  end
end
