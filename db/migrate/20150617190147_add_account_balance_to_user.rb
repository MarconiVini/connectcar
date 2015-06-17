class AddAccountBalanceToUser < ActiveRecord::Migration
  def change
    add_column :users, :account_balance, :decimal
  end
end