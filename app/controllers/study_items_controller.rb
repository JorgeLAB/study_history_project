class StudyItemsController < ApplicationController
  before_action :load_study_item, only: [:update, :edit, :destroy]

  def new
    @study_item = StudyItem.new
  end

  def create
    @study_item = StudyItem.new(study_item_params)

    if @company.save
      flash[:notice] = "Foi realizada a criação."
      redirect_to root_path
    else
      flash[:error] = "Não foi possível salvar."
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @study_item.update(study_item_params)
      flash[:notice] = 'Nota atualizado com sucesso'
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @study_item.destroy!

    flash[:notice] = 'Nota deletada com sucesso.'
    redirect_to "/"
  rescue
    flash[:alert] = @study_item.errors.full_messages
    render "/"
  end

  private

  def study_item_params
    return {} unless params.has_key?(:study_item)
    params.require(:study_item).permit(:title, :category, :description)
  end

  def load_study_item
    @study_item = StudyItem.find(params[:id])
  end
end
