# frozen_string_literal: true

class SessionRecord < ActiveRecord::SessionStore::Session
  self.abstract_class = true

  connects_to database: {writing: :patrons}
end
