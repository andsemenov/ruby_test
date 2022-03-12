require 'retrieve_from_json'
module CurrencyExchange
  # Return the exchange rate between from_currency and to_currency on date as a float.
  # Raises an exception if unable to calculate requested rate.
  # Raises an exception if there is no rate for the date provided.
  def self.rate(date, from_currency, to_currency)
    # TODO: calculate and return rate
    from_currency_value = retrieve_from_json(date, from_currency, to_currency).get_from_currency
    to_currency_value = retrieve_from_json(date, from_currency, to_currency).get_to_currency
    begin
    result = to_currency_value/from_currency_value
    rescue ZeroDivisionError
      puts "Tried to divide by zero"
    rescue  => e  
      puts e.message
    end
    return result
  end

end
