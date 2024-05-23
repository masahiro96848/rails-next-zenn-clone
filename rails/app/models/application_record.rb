# frozen_string_literal: true

# ApplicationRecord serves as the base class for all models in the application.
# It is an abstract class that provides common functionality for all models.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
