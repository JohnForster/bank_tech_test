require './lib/account.rb'

describe Account do
  before(:each) do
    @account = Account.new
  end

  describe '#deposit' do
    it 'creates a new transaction' do
      transaction = class_double('Transaction').as_stubbed_const
      expect(transaction).to receive(:new).with(23.40)
      @account.deposit(23.40)
    end
  end
end