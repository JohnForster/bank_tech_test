class Transaction

  TRANSACTION_ERROR = 'No transaction amount given'.freeze

  attr_reader :balance_change, :type, :time

  def initialize(amount = 0)
    raise ArgumentError, TRANSACTION_ERROR if amount.zero?
    @balance_change = amount
    @type = (amount > 0 ? :deposit : :withdrawal)
    @time = Time.new
  end
end