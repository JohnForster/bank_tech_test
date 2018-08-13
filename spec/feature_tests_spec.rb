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
end