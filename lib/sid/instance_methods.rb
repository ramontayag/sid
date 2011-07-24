module Sid
  module InstanceMethods
    def sid_column=(value)
      self.send :"#{self.class.sid_config[:sid_column]}=", value
    end

    def sid_column
      self.send :"#{self.class.sid_config[:sid_column]}"
    end

    private

    def set_sid_column
      scoped_by = self.class.sid_config[:scoped_by]
      collection = self.class.where(scoped_by => self.send(scoped_by))

      if collection.count.zero?
        self.sid_column = 1
      else
        self.sid_column = collection.reorder('id').last.sid_column + 1
      end
    end
  end
end
