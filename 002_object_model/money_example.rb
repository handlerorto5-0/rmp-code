require 'money'
Money.locale_backend = nil

class Numeric
  def to_money(currency = nil)
    Money.from_amount(self, currency || Money.default_currency)
  end
end

standart_price = 100.to_money("USD")
p standart_price.format