require 'braavos/engine'
require 'braavos/get_balance'
require 'braavos/transfer_money'

module Braavos
  def self.get_balance(account_id:)
    GetBalance.get(account_id: account_id)
  end

  def self.transfer_money(source_account_id:, destination_account_id:, amount:)
    TransferMoney.transfer(source_account_id: source_account_id,
                                     destination_account_id: destination_account_id,
                                     amount: amount)
  end
end
