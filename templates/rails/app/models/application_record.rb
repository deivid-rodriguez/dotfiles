# frozen_string_literal: true
#
# Main base model class
#
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end