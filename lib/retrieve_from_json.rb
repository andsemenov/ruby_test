require 'date'
require_relative 'currency'
require 'json'

BASE_CURRENCY = "EUR"

def retrieve_from_json(date, from_currency, to_currency)
  
  file = File.read('./data/eurofxref-hist-90d.json')
  data_hash = JSON.parse(file)
  date_string = date.strftime("%Y-%m-%d")
  begin
    from_currency_value = data_hash[date_string][from_currency]
    to_currency_value = data_hash[date_string][to_currency]
    raise Error if from_currency_value.nil? || to_currency_value.nil?
  rescue
    if to_currency == BASE_CURRENCY
      from_currency_value = data_hash[date_string][from_currency]
      to_currency_value = 1
    elsif from_currency == BASE_CURRENCY
      from_currency_value = 1
      to_currency_value = data_hash[date_string][to_currency]
    else
      p "No exchange rate in json"
    end
  end
  currency = Currency.new(from_currency_value, to_currency_value)
  return currency
end




