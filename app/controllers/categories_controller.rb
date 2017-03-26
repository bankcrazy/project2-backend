class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    respond_to do |format|
      format.html { redirect_to @categories }
      format.json { render json: @categories.to_json }
    end
  end

  private
    def group_params
      params.require(:category).permit(:title)
    end

end
