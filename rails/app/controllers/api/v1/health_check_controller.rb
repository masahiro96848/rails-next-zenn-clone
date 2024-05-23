# frozen_string_literal: true

module Api
  module V1
    # HealthCheckController handles health check requests for the API.
    # It responds with a success message when the API is functioning correctly.
    class HealthCheckController < ApplicationController
      def index
        render json: { message: 'Success Health Check!' }, status: :ok
      end
    end
  end
end
