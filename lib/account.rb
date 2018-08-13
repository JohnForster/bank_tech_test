require 'terminal-table'
require './lib/transaction.rb'

class Account
  NEGATIVE_WITHDRAWAL_ERROR = 'Cannot withdraw a negative amount.'

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @transactions.push(Transaction.new(amount))
  end

  def withdraw(amount)
    raise ArgumentError, NEGATIVE_WITHDRAWAL_ERROR if amount < 0
    @transactions.push(Transaction.new(-amount))
  end

  def print
    rows = @transactions
    table = Terminal::Table.new :headings => %w[Date Credit Debit Balance], :rows => rows
    puts table
  end
end