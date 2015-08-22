module Braavos
  class TransferMoney
    def self.transfer(source_account_id:, destination_account_id:, amount:)
      return false if Braavos.get_balance(account_id: source_account_id) < amount

      ActiveRecord::Base.transaction do
        Trade.create!(account_id: destination_account_id, amount: amount)
        Trade.create!(account_id: source_account_id, amount: - amount)
      end
    end
  end
end
