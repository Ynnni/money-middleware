module Api
  class CategoriesController < ApplicationController
    before_action :find_category, only: [:show, :update, :destroy]

    respond_to :json

    def index
      @categories = Category.all
      respond_with @categories
    end

    def create
      @category = Category.create categories_params
      respond_with :api, @category
    end

    def show
      respond_with @category
    end

    def update
      @category.update categories_params
      respond_with @category
    end

    def destroy
      @category.destroy
      respond_with @category
    end

    private

    def find_category
      @category = Category.find params[:id]
    end

    def categories_params
      params.require(:category).permit :title, :description
    end
  end
end
