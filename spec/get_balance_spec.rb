require 'spec_helper'

module Braavos
  describe GetBalance do
    describe '.get_balance' do
      subject(:get_balance) { Braavos.get_balance(account_id: account_id) }

      let(:account_id) { 1 }
      let(:amount) { 10_000 }
      let(:trade) { Trade.create!(account_id: account_id, amount: amount) }

      context 'when there is only one credit Trade' do
        before { trade }

        it { expect(get_balance).to eq(amount) }
      end

      context 'when there are two credit Trades' do
        let(:another_amount) { 2_200 }
        let(:another_trade) { Trade.create!(account_id: account_id, amount: another_amount) }

        before do
          trade
          another_trade
        end

        it { expect(get_balance).to eq(amount + another_amount) }
      end

      context 'when there is a credit and a debit' do
        let(:debit_amount) { -500 }
        let(:debit_trade) { Trade.create!(account_id: account_id, amount: debit_amount) }

        before do
          trade
          debit_trade
        end

        it { expect(get_balance).to eq(amount + debit_amount) }
      end

      context 'Trades from another accounts' do
        let(:debit_amount) { -500 }
        let(:debit_trade) { Trade.create!(account_id: 33, amount: debit_amount) }
        before do
          trade
          debit_trade
        end

        it 'ignores them' do
          expect(get_balance).to eq(amount)
        end
      end
    end
  end
end
