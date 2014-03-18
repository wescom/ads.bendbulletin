class AddApprovalToJobFiles < ActiveRecord::Migration
  def self.up
    add_column :job_files, :approved, :boolean, :default => false
    add_column :job_files, :approved_at, :datetime
  end

  def self.down
    remove_column :job_files, :approved
    remove_column :job_files, :approved_at
  end
end
