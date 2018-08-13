class Transaction
  attr_reader :balance_change
  def initialize(amount)
    @balance_change = amount
  end
end