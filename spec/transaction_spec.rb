require './lib/transaction.rb'

describe Transaction do
  describe '#initialize' do
    it 'should store the balance change' do
      transaction = Transaction.new(23.23)
      expect(transaction.balance_change).to eq(23.23)
    end
  end
end