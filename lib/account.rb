require 'terminal-table'
require './lib/transaction.rb'

class Account
  NEGATIVE_WITHDRAWAL_ERROR = 'Cannot withdraw a negative amount.'.freeze
  NEGATIVE_DEPOSIT_ERROR = 'Cannot deposit a negative amount.'.freeze

  def initialize
    @balance = 0g
    @transactions = []
  end

  def deposit(amount)
    raise ArgumentError, NEGATIVE_DEPOSIT_ERROR if amount < 0
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