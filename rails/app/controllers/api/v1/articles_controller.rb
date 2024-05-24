# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      def show
        article = Article.published.find(params[:id])
        render json: article
      end
    end
  end
end
