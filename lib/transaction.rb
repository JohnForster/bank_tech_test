class Transaction
  attr_reader :balance_change, :type, :time
  def initialize(amount)
    @balance_change = amount
    @type = (amount > 0 ? :deposit : :withdrawal)
    @time = Time.new
  end
end