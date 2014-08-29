class CreateAddRejectionToJobFiles < ActiveRecord::Migration
  def self.up
    add_column :job_files, :rejected, :boolean, :default => false
    add_column :job_files, :rejected_at, :datetime
  end

  def self.down
    remove_column :job_files, :rejected
    remove_column :job_files, :rejected_at
  end
end
