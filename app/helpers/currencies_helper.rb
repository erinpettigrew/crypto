module CurrenciesHelper
  def display_live_price(currency, exchange)
    price = PriceFetcher.new(currency,exchange).fetch
    if price.nil?
      ""
    else
      display_price = round(price)
      "$" + number_with_delimiter(display_price, :delimiter => ',')
    end
  end

  def round(price)

    if price.class == Float
      return price.round(2)
    end

    if price.class == Fixnum
      price = price.to_s
    end

    length = price.length
    decimal_location = price.index('.')
    rounded_price = price
    
    if decimal_location == nil
      rounded_price = price + ".00"
    elsif length - decimal_location > 3
      rounded_price = price[0...decimal_location + 3]
    elsif length - decimal_location == 2
      rounded_price = price + "0"
    elsif length - decimal_location == 1
      rounded_price = price + "00"
    end
      rounded_price
    end

end
