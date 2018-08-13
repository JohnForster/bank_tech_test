class StatementPrinter
  def self.print(transaction_array)
    table = Terminal::Table.new headings: %w[Date Credit Debit Balance], rows: transaction_array
    puts table
  end
end