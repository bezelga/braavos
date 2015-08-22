module Braavos
  class GetBalance
    def self.get(account_id:)
      Trade.where(account_id: account_id).sum(:amount)
    end
  end
end
