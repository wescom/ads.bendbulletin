class AddDescriptionToRole < ActiveRecord::Migration
  def self.up
    add_column :roles, :description, :string
    add_column :roles, :sort_order, :integer
  end

  def self.down
    remove_column :roles, :description
    remove_column :roles, :sort_order
  end
end
