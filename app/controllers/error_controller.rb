class ErrorController < ApplicationController
  def index
    @q = ErrorContent.ransack(params[:q])
    @errors = @q.result.page(params[:page])
  end

  def new
    @error = ErrorContent.new
    @versions = Master::Middle.find_by(id: params[:version])&.version
  end

  def versions
    @versions = Master::Middle.find_by(id: params[:version])&.version
  end
end
