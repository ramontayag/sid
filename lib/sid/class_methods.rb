module Sid
  module ClassMethods
    extend ActiveSupport::Concern
    included do
      before_create :set_sid_column
      validates sid_config[:sid_column], :uniqueness => {:scope => sid_config[:scoped_by]}
    end
  end
end
