class AddDisclaimerCheckboxToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :disclaimer, :boolean
  end

  def self.down
    remove_column :jobs, :disclaimer
  end
end
