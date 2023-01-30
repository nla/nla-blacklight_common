# frozen_string_literal: true

# This tells Rails that any model that extends this base class will connect to the
# patrons database.
class PatronRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: {writing: :patrons}
end
