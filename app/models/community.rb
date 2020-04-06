# frozen_string_literal: true

class Community
  belogs_to :account
  validate_presence_of :url, :name
end
