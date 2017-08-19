class PriceFetcher

  attr_accessor :currency, :exchange

  def initialize(currency, exchange)
    @currency = currency
    @exchange = exchange
  end

  def fetch
    if @exchange.name == "Coinbase"
      HTTParty.get("https://api.coinbase.com/v2/prices/" + currency.ticker + "-USD/buy")["data"]["amount"]
    else
      nil
      # HTTParty.get("https://min-api.cryptocompare.com/data/price?fsym=" + currency.ticker + "&tsyms=USD")["USD"]
    end
  end

end
