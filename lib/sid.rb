require 'sid/class_methods'
require 'sid/instance_methods'

module Sid
  def has_sid(scoped_by)
    cattr_accessor :scoped_by
    self.scoped_by = scoped_by

    include Sid::ClassMethods
    include Sid::InstanceMethods
  end
end

ActiveRecord::Base.extend Sid
