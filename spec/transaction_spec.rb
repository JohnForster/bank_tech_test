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
end