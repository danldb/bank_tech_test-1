#understands what a transaction is - deposit or withdrawal
class Transaction

  def initialize(args)
    @time = args[:time]
    @credit = args[:credit]
    @debit = args[:debit]
    @balance = args[:balance]
  end

end
