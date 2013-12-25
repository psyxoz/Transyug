class IpTracking < ActiveRecord::Base
  self.table_name = 'ip_tracking'

  attr_accessible :ip, :message
  serialize :message, Hash
end
