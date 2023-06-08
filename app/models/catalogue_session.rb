# frozen_string_literal: true

# == Schema Information
#
# Table name: sessions
#
#  id         :bigint           not null, primary key
#  data       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  session_id :string(255)      not null
#
# Indexes
#
#  index_sessions_on_session_id  (session_id) UNIQUE
#  index_sessions_on_updated_at  (updated_at)
#
class CatalogueSession < SessionRecord
  # Need to define this custom session class, so it will look for sessions in the database
  # configured in SessionRecord
end
