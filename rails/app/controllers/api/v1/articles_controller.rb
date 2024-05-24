# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.published.order(created_at: :desc).page(params[:page] || 1).per(10)
        render json: articles
      end

      def show
        article = Article.published.find(params[:id])
        render json: article
      end
    end
  end
end
