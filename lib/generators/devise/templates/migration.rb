class FreemiumCreate<%= table_name.camelize %> < ActiveRecord::Migration
  def self.up
    create_table(:<%= table_name %>) do |t|
      

      
      t.subscribable

      t.timestamps
    end

    # add_index :<%= table_name %>, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :<%= table_name %>
  end
end