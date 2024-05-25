# frozen_string_literal: true

module Pagination
  extend ActiveSupport::Concern

  def pagination(records)
    {
      current_page: records.current_page, # 現在のページ
      total_pages: records.total_pages #
    }
  end
end
