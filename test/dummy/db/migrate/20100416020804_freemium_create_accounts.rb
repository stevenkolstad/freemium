class FreemiumCreateAccounts < ActiveRecord::Migration
  def self.up
    create_table(:accounts) do |t|
      

      
      t.subscribable

      t.timestamps
    end

    # add_index :accounts, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :accounts
  end
end