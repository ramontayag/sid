class Category < ActiveRecord::Base
  has_sid :account_id, :sid_column => :alternative_sid
end
