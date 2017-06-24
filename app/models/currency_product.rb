class CurrencyProduct < ActiveRecord::Base
  belongs_to :currency
  belongs_to :product
end
