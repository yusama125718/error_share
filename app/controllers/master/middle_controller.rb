class Master::MiddleController < ApplicationController
  before_action :get_data, only: [:destroy, :edit, :update]

  def index
    @q = Master::Middle.ransack(params[:q])
    @middles = @q.result.page(params[:page])
  end

  def new
    @middle = Master::Middle.new
  end

  def create
    @middle = Master::Middle.new(middle_params)
    if @middle.save
      redirect_to master_middle_index_path, flash: { success: t("common.create.success") }
    else
      @url = master_middle_index_path
      flash.now[:danger] = t("common.create.error")
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    # TODO:紐づくエラーデータがあったら消せないようにする
    # バージョンのみ紐づくデータがあればモーダルで警告を出す
    if @middle.version.exists? && params[:confirm].blank?
      @modal_title = "確認"
      @pertial = "/master/middle/confirm_destroy"
      render "/shared/draw_modal"
      return
    end
    if @middle.destroy
      flash[:success] = t("common.destroy.success")
    else
      flash[:danger] = t("common.destroy.error")
    end
    # Turboリクエストの際はJSでリダイレクトする
    if turbo_frame_request?
      @url = master_middle_index_url
      render "/shared/turbo_redirect"
    else
      redirect_to master_middle_index_path
    end
  end

  def edit
  end

  def update
    if @middle.update(middle_params)
      redirect_to master_middle_index_path, flash: { success: t("common.update.success") }
    else
      @url = master_middle_path
      flash.now[:danger] = t("common.update.error")
      render :form_update, status: :unprocessable_entity
    end
  end

  private

  def get_data
    @middle = Master::Middle.find_by(id: params[:id])
    if @middle.blank?
      redirect_to master_middle_index_path, flash: { danger: t("common.no_data") }
    end
  end

  def middle_params
    params.require(:master_middle).permit(:name)
  end
end
