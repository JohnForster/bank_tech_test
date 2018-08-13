require './lib/account.rb'

describe Account do
  before(:each) do
    @transaction_class = class_double('Transaction').as_stubbed_const
    @statement_printer = class_double('StatementPrinter').as_stubbed_const
    @account = Account.new
  end

  describe '#deposit' do
    it 'creates a new transaction' do
      expect(@transaction_class).to receive(:new).with(23.40, 23.40)
      @account.deposit(23.40)
    end

    it 'raises an error if value given is negative' do
      negative_error = 'Cannot withdraw a negative amount.'
      stub_const('Account::NEGATIVE_DEPOSIT_ERROR', negative_error)
      expect { @account.deposit(-1) }.to raise_error negative_error
    end

    it 'raises an error if more than two decimal places are given' do
      decimal_error = 'More than two decimal places given.'
      stub_const('Account::DECIMAL_ERROR', decimal_error)
      expect { @account.deposit(23.4056) }.to raise_error decimal_error
    end
  end

  describe '#withdraw' do
    it 'creates a new transaction' do
      expect(@transaction_class).to receive(:new).with(-23.40, -23.4)
      @account.withdraw(23.40)
    end

    it 'raises an error if value given is negative' do
      negative_error = 'Cannot withdraw a negative amount.'
      stub_const('Account::NEGATIVE_WITHDRAWAL_ERROR', negative_error)
      expect { @account.withdraw(-1) }.to raise_error negative_error
    end

    it 'raises an error if more than two decimal places are given' do
      decimal_error = 'More than two decimal places given.'
      stub_const('Account::DECIMAL_ERROR', decimal_error)
      expect { @account.withdraw(23.4056) }.to raise_error decimal_error
    end
  end

  describe '#statement' do
    it 'should call the print function on the given statement printer' do
      transaction_list = double('transaction_list')
      @account.instance_variable_set(:@transactions, transaction_list)
      expect(@statement_printer).to receive(:print_statement).with(transaction_list)
      @account.statement
    end
  end
end