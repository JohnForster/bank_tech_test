require 'terminal-table'
require './lib/transaction.rb'
require './lib/statement_printer.rb'

# Represents a bank account, which can handle withdrawals and deposits.
class Account
  NEGATIVE_WITHDRAWAL_ERROR = 'Cannot withdraw a negative amount.'.freeze
  NEGATIVE_DEPOSIT_ERROR = 'Cannot deposit a negative amount.'.freeze
  DECIMAL_ERROR = 'Cannot deposit fractions of a penny.'.freeze

  def initialize(statement_printer = StatementPrinter)
    @balance = 0
    @transactions = []
    @statement_printer = statement_printer
  end

  def deposit(amount)
    raise ArgumentError, DECIMAL_ERROR unless correct_decimals?(amount)
    raise ArgumentError, NEGATIVE_DEPOSIT_ERROR if amount < 0
    subsequent_balance = @balance += amount
    @transactions.push(Transaction.new(amount, subsequent_balance))
  end

  def withdraw(amount)
    raise ArgumentError, DECIMAL_ERROR unless correct_decimals?(amount)
    raise ArgumentError, NEGATIVE_WITHDRAWAL_ERROR if amount < 0
    subsequent_balance = @balance -= amount
    @transactions.push(Transaction.new(-amount, subsequent_balance))
  end

  def statement
    @statement_printer.print_statement(@transactions)
  end

  private

  def correct_decimals?(number)
    ((number * 100) % 1).zero?
  end
end
