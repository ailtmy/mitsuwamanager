class MitsuwaDocsController < ApplicationController
  before_action :set_mitsuwa_doc, only: [:show, :edit, :update, :destroy]

  def index
    @q = MitsuwaDoc.ransack(params[:q])
    @mitsuwa_docs = @q.result.order('mitsuwa_docs.created_at desc').page(params[:page]).per(10)
  end

  def show
  end

  def new
    @mitsuwa_doc = MitsuwaDoc.new
  end

  def edit
  end

  def create
    @mitsuwa_doc = MitsuwaDoc.new(mitsuwa_doc_params)

    if @mitsuwa_doc.save
      redirect_to mitsuwa_doc_path(@mitsuwa_doc), notice: "#{@mitsuwa_doc.title}を登録しました。"
    else
      render :new
    end
  end

  def update
    if params[:mitsuwa_doc][:image_ids].present?
      params[:mitsuwa_doc][:image_ids].each do |image_id|
        image = @mitsuwa_doc.images.find(image_id)
        image.purge
      end
    end
    if @mitsuwa_doc.update(mitsuwa_doc_params)
      redirect_to mitsuwa_doc_path(@mitsuwa_doc), notice: "#{@mitsuwa_doc.title}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @mitsuwa_doc.images.purge if @mitsuwa_doc.images.attached?
    @mitsuwa_doc.destroy
    redirect_to mitsuwa_docs_path, notice: "#{@mitsuwa_doc.title}を削除しました。"
  end

  private

  def mitsuwa_doc_params
    params.require(:mitsuwa_doc).permit(:title, :category, :kind, :content, :user_id, :date, :images)
  end

  def set_mitsuwa_doc
    @mitsuwa_doc = MitsuwaDoc.find(params[:id])
  end
end
