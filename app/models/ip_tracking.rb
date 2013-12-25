class IpTracking < ActiveRecord::Base
  attr_accessible :ip, :message
  serialize :message, Hash
end
