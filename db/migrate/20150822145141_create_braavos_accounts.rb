class CreateBraavosAccounts < ActiveRecord::Migration
  def change
    create_table :braavos_accounts do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
