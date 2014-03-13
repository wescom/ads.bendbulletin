class AddApprovalToJobFiles < ActiveRecord::Migration
  def self.up
    add_column :job_files, :approved, :boolean, :default => false
  end

  def self.down
    remove_column :job_files, :approved
  end
end
