class StudyItemsController < ApplicationController
  def new
    @study_item = StudyItem.new
  end

  def create
    @study_item = StudyItem.create(study_item_params)

    if @study_item.save!
      redirect_to "/"
    else
      render new
    end
  end
  # def update

  # end

  # def destroy
  # end

  private

  def study_item_params
    # return {} if @study_item.nil@
    params.require(:study_item).permit(:title, :category, :description)
  end
end
