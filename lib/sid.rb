require 'sid/class_methods'
require 'sid/instance_methods'

module Sid
  def has_sid(scoped_by, options={})
    cattr_accessor :sid_config
    self.sid_config={}
    self.sid_config[:scoped_by] = scoped_by
    self.sid_config[:sid_column] = options[:sid_column] || :sid

    include Sid::ClassMethods
    include Sid::InstanceMethods
  end
end

ActiveRecord::Base.extend Sid
