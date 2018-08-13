require 'terminal-table'

class Account
  def initialize
    @balance = 0
    @transactions = []
  end

  def print
    rows = @transactions
    table = Terminal::Table.new :headings => %w[Date Credit Debit Balance], :rows => rows
    puts table
  end
end