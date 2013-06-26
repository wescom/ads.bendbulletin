class AddContactInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :company, :string
    add_column :users, :acct_no, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string, :limit => 2
    add_column :users, :zip, :string, :limit => 5
    add_column :users, :phonenum, :string
    add_column :users, :phonenum2, :string
    add_column :users, :fax, :string
  end

  def self.down
    remove_column :users, :company
    remove_column :users, :acct_no
    remove_column :users, :address1
    remove_column :users, :address2
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip
    remove_column :users, :phonenum
    remove_column :users, :phonenum2
    remove_column :users, :fax
  end
end
