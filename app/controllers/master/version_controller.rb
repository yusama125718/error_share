class Master::VersionController < ApplicationController
  def index
    @q = Master::Version.includes(:middle).ransack(params[:q])
    @versions = @q.result.page(params[:page])
  end

  def new
    @version = Master::Version.new
  end

  def create
    @version = Master::Version.new(version_params)
    if @version.save
      redirect_to master_version_index_path, flash: { success: t("common.create.success") }
    else
      @url = master_version_index_path
      flash.now[:danger] = t("common.create.error")
      render :form_update, status: :unprocessable_entity
    end
  end

  def edit
    @version = Master::Version.find_by(id: params[:id])
    if @version.blank?
      redirect_to master_version_index_path, flash: { danger: t("common.no_data") }
    end
  end

  def update
    @version = Master::Version.find_by(id: params[:id])
    if @version.update(version_params)
      redirect_to master_version_index_path, flash: { success: t("common.update.success") }
    else
      @url = master_version_path
      flash.now[:danger] = t("common.update.error")
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    target = Master::Version.find_by(id: params[:id])
    # TODO:紐づくエラーデータがあったら消せないようにする
    if target.destroy
      flash[:success] = t("common.destroy.success")
    else
      flash[:danger] = t("common.destroy.error")
    end
    redirect_to master_version_index_path
  end

  private

  def version_params
    params.require(:master_version).permit(:name, :middle_id)
  end
end
