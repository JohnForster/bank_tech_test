require 'helper_functions'
require './lib/statement_printer.rb'

describe StatementPrinter do
  describe '.print' do
    it 'should print out an array of transactions' do
      t1 = double('transaction2',
                  time: Time.new(2018, 6, 1),
                  balance_change: 40.14,
                  type: :deposit,
                  subsequent_balance: 40.14)
      t2 = double('transaction2',
                  time: Time.new(2018, 7, 1),
                  balance_change: -20,
                  type: :withdrawal,
                  subsequent_balance: 20.14)
      output = capture_stdout { StatementPrinter.print([t1, t2]) }
      output.map! { |line| line.delete(' ') }
      expect(output).to include("|1/6/2018|40.14||40.14|")
      expect(output).to include('|1/7/2018||20.00|20.14|')
    end
  end
end