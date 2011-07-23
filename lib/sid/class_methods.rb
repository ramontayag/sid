module Sid
  module ClassMethods
    extend ActiveSupport::Concern
    included do
      before_create :set_sid_column
    end
  end
end
