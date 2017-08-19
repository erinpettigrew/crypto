module CurrenciesHelper
  def display_live_price(currency, exchange)
    price = PriceFetcher.new(currency,exchange).fetch
    if price.nil?
      ""
    else
      "$" + number_with_delimiter(price, :delimiter => ',')
    end
  end
end
