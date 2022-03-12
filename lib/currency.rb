class Currency
    def initialize(from_currency, to_currency)
      @from_currency= from_currency
      @to_currency= to_currency
    end
    def get_from_currency
      @from_currency
    end
    def get_to_currency
      @to_currency
    end
end