class Master::MiddleController < ApplicationController
  def index
    @q = Master::Middle.ransack(params[:q])
    @middles = @q.result.page(params[:page])
  end
end
