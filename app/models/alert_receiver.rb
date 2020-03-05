class AlertReceiver < ApplicationRecord
  validates_presence_of :browser_id, :message => "browser_id can't be blank!"
end
