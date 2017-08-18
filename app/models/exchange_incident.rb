class ExchangeIncident < ActiveRecord::Base
  belongs_to :exchange
  belongs_to :incident
end
