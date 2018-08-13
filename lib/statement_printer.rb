class StatementPrinter
  def self.print(transaction_array)
    rows = transaction_array.map { |t| row_array(t) }
    table = Terminal::Table.new headings: %w[Date Credit Debit Balance], rows: rows
    puts table
  end

  def self.row_array(trans)
    trans.type == :withdrawal ? format_withdrawal(trans) : format_deposit(trans)
  end

  def self.format_withdrawal(trans)
    [dmy(trans.time),
     nil,
     two_dp(-trans.balance_change.round(2)),
     two_dp(trans.subsequent_balance.round(2))]
  end

  def self.format_deposit(trans)
    [dmy(trans.time),
     two_dp(trans.balance_change),
     nil,
     two_dp(trans.subsequent_balance.round(2))]
  end

  def self.dmy(time)
    time.strftime("%_d/%_m/%Y")
  end

  def self.two_dp(number)
    format('%.2f', number)
  end

  private_class_method :row_array, :format_withdrawal, :format_deposit, :dmy
end