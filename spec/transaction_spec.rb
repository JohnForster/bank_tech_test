require './lib/transaction.rb'

describe Transaction do
  describe '#initialize' do
    it 'should store the balance change' do
      balance_change = rand(100).round(2)
      transaction = Transaction.new(balance_change)
      expect(transaction.balance_change).to eq(balance_change)
    end
  end

  it "should have type 'withdrawal' if balance_change < 0" do
    transaction = Transaction.new(-5.43)
    expect(transaction.type).to eq(:withdrawal)
  end

  it "should have type 'deposit' if balance_change > 0" do
    transaction = Transaction.new(5.43)
    expect(transaction.type).to eq(:deposit)
  end

  it 'should store the time of the transaction' do
    t1 = Time.new
    transaction = Transaction.new(1)
    t2 = Time.new
    expect(t1 <=> transaction.time).to eq(-1)
    expect(t2 <=> transaction.time).to eq(1)
  end

  it 'should throw an error if the transaction amount is 0' do
    transaction_error = 'No transaction amount given'
    stub_const('Transaction::TRANSACTION_ERROR', transaction_error)
    expect { Transaction.new(0) }.to raise_error transaction_error
  end
end