class Incident < ActiveRecord::Base
  has_many :exchange_incidents
  has_many :exchanges, through: :exchange_incidents
end
