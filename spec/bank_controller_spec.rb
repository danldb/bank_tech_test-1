require 'bank_controller'

describe BankController do
  subject(:bank_controller) { described_class.new(transaction_class) }
  let (:transaction_class) { double(:transaction_class, new: transaction_deposit) }
  let (:transaction_deposit) { double(:transaction_deposit, amount: 100, current_balance: 100, time: @time_now )}

  let (:transaction_class) { double(:transaction_class, new: transaction_withdrawl) }
  let (:transaction_withdrawl) { double(:transaction_withdrawl, amount: 50, current_balance: 50, time: @time_now )}


context '#add_deposit' do
  before do
    bank_controller.add_deposit(100)
  end

  it ' should update balance' do
    expect(bank_controller.balance).to eq(100)
  end

  it 'should create a new transaction' do
    @time_now = Time.now
    allow(Time).to receive(:now).and_return(@time_now)
    expect(bank_controller.instance_variable_get(:@current_transaction)).to eq(transaction_deposit)
  end

  it 'should add transaction to transactions array' do
    expect(bank_controller.transactions).to eq([transaction_deposit])
  end
end


context '#deduct_withdrawl' do
  before do
    bank_controller.add_deposit(100)
    bank_controller.deduct_withdrawl(50)
  end

  it 'should update balance if sufficient funds' do
    expect(bank_controller.balance).to eq(50)
  end

  it 'should create a new transaction if sufficient funds' do
    @time_now = Time.now
    allow(Time).to receive(:now).and_return(@time_now)
    expect(bank_controller.instance_variable_get(:@current_transaction)).to eq(transaction_withdrawl)
  end

  it 'should add transaction to transactions array' do
    expect(bank_controller.transactions).to eq([transaction_deposit, transaction_withdrawl])
  end

end

context '#print_transactions' do
  before do
    transactions.push(transaction_withdrawl, transaction_deposit)
  end

  it 'should print transactions' do
    bank_controller.print_transactions

  end
end






end
