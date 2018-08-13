require 'rspec'
require 'helper_functions'
require './lib/account.rb'

describe 'Feature tests' do
  before(:each) do
    @bank_account = Account.new
  end

  it 'displays the results in a table of date, credit, debit and balance' do
    output = capture_stdout { @bank_account.print }
    output.map! { |line| line.delete(' ') }
    expect(output).to include('|Date|Credit|Debit|Balance|')
  end

  it 'is entirely functional' do
    formatted_time = Time.new().strftime("%d/%m/%Y")
    @bank_account.deposit(400)
    @bank_account.withdraw(150)
    @bank_account.deposit(33)
    output = capture_stdout do
      @bank_account.print
    end
    output.map! { |line| line.delete(' ') }
    expect(output).to include('|Date|Credit|Debit|Balance|')
    expect(output).to include("|#{formatted_time}|400.00||400.00|")
    expect(output).to include("|#{formatted_time}||150.00|250.00|")
    expect(output).to include("|#{formatted_time}|33.00||283.00|")
  end
end