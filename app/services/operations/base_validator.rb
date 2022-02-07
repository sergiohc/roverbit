# frozen_string_literal: true

module Operations
  class BaseValidator < SimpleDelegator
    include ActiveModel::Validations
  end
end
