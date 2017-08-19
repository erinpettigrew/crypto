class PriceFetcher

  attr_accessor :currency, :exchange

  def initialize(currency, exchange)
    @currency = currency
    @exchange = exchange
  end

  def fetch
    if @exchange.name.downcase == "coinbase" || @exchange.name.downcase == "gdax"
      HTTParty.get("https://api.coinbase.com/v2/prices/" + currency.ticker + "-USD/buy")["data"]["amount"]
    elsif @exchange.name.downcase == "gemini"
      HTTParty.get("https://api.gemini.com/v1/pubticker/" + currency.ticker + "usd")["ask"]
    elsif @exchange.name.downcase == "bitstamp"
      HTTParty.get("https://www.bitstamp.net/api/v2/ticker/" + currency.ticker + "usd").parsed_response["ask"]
    elsif @exchange.name.downcase == "cex.io" || @exchange.name.downcase == "cex"
      HTTParty.get("https://cex.io/api/ticker/" + currency.ticker.upcase + "/USD")["ask"]
    elsif @exchange.name.downcase == "itbit"
      if Rails.env.production?
        HTTParty.get("https://api.itbit.com/v1/markets/XBTUSD/ticker")["ask"]
      end
    else
      nil
      # HTTParty.get("https://min-api.cryptocompare.com/data/price?fsym=" + currency.ticker + "&tsyms=USD")["USD"]
    end
  end
end
