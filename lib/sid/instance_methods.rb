module Sid
  module InstanceMethods
    private

    def set_sid_column
      collection = self.class.where(self.class.scoped_by => self.send(self.class.scoped_by))

      if collection.count.zero?
        self.sid = 1
      else
        self.sid = collection.reorder('id').last.sid + 1
      end
    end
  end
end
