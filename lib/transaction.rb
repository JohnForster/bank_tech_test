class Transaction
  attr_reader :balance_change, :type
  def initialize(amount)
    @balance_change = amount
    @type = (amount > 0 ? :deposit : :withdrawal)
  end
end