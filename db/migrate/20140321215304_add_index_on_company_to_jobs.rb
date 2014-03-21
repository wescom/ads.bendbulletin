class AddIndexOnCompanyToJobs < ActiveRecord::Migration
  def self.up
    add_index(:jobs, :company)
  end

  def self.down
    remove_index(:jobs, :company)
  end
end
