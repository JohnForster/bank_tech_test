require 'rspec'
require 'helper_functions'
require 'Account.rb'


describe 'Feature tests' do
  before(:each) do
    bank_account = Account.new
  end

  it 'displays the results in a table of date, credit, debit and balance' do
    $stdout = StringIO.new
    bank_account.print
    expect(output_as_array_without_spaces).to include('|Date|Credit|Debit|Balance|')
  end
end