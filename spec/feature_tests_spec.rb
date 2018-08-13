require 'rspec'
require 'helper_functions'
require './lib/account.rb'

describe 'Feature tests' do
  before(:each) do
    @bank_account = Account.new
  end

  it 'displays the results in a table of date, credit, debit and balance' do
    output = capture_stdout { @bank_account.statement }
    output.map! { |line| line.delete(' ') }
    expect(output).to include('|Date|Credit|Debit|Balance|')
  end

  it 'displays a deposit' do
    formatted_date = Time.new.strftime('%_d/%_m/%Y').delete(' ')
    @bank_account.deposit(200)
    output = capture_stdout { @bank_account.statement }
    output.map! { |line| line.delete(' ') }
    expect(output).to include("|#{formatted_date}|200.00||200.00|")
  end

  it 'is entirely functional' do
    formatted_date = Time.new.strftime('%_d/%_m/%Y').delete(' ')
    @bank_account.deposit(400)
    @bank_account.withdraw(150)
    @bank_account.deposit(33)
    output = capture_stdout do
      @bank_account.statement
    end
    output.map! { |line| line.delete(' ') }
    expect(output).to include('|Date|Credit|Debit|Balance|')
    expect(output).to include("|#{formatted_date}|400.00||400.00|")
    expect(output).to include("|#{formatted_date}||150.00|250.00|")
    expect(output).to include("|#{formatted_date}|33.00||283.00|")
  end
end