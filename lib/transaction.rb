# Represents a single transaction, which is stored in the account.
class Transaction
  TRANSACTION_ERROR = 'No transaction amount given'.freeze

  attr_reader :balance_change, :type, :time, :subsequent_balance

  def initialize(amount, subsequent_balance = amount)
    raise ArgumentError, TRANSACTION_ERROR if amount.zero?
    @balance_change = amount
    @type = (amount > 0 ? :deposit : :withdrawal)
    @time = Time.new
    @subsequent_balance = subsequent_balance
  end
end