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
      last = collection.reorder('id').last

      self.sid_column = if last
        last.sid_column + 1
      else
        1
      end
    end
  end
end
