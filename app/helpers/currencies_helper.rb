module CurrenciesHelper
  def display_price(currency)
    fetcher = PriceFetcher.new(currency)
    @price_data = fetcher.fetch
    @price_data["USD"]
  end
end
