class IncomingText < ActiveRecord::Base
  validates_presence_of :phone_number
end
