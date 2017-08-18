class PriceFetcher

  attr_reader :currency
  attr_accessor :endpoint

  def initialize(currency)
    @endpoint = "https://min-api.cryptocompare.com/data/price?fsym=" + currency.ticker + "&tsyms=USD"
  end

  def fetch
    price_data = HTTParty.get(@endpoint)
  end

end
