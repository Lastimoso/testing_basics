# frozen_string_literal: true

module Projectable
  extend ActiveSupport::Concern
  included do
    before_validation do
      self.name = nil if self.persisted?
    end
  end
end