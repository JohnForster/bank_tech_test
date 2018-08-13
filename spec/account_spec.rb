require './lib/account.rb'

describe Account do
  before(:each) do
    @account = Account.new
    @transaction_class = class_double('Transaction').as_stubbed_const
  end

  describe '#deposit' do
    it 'creates a new transaction' do
      expect(@transaction_class).to receive(:new).with(23.40)
      @account.deposit(23.40)
    end
  end

  describe '#withdraw' do
    it 'creates a new transaction' do
      expect(@transaction_class).to receive(:new).with(-23.40)
      @account.withdraw(23.40)
    end

    it 'raises an error if value given is negative' do
      negative_error = 'Cannot withdraw a negative amount.'
      stub_const('Account::NEGATIVE_WITHDRAWAL_ERROR', negative_error)
      expect { @account.withdraw(-1) }.to raise_error negative_error
    end
  end
end