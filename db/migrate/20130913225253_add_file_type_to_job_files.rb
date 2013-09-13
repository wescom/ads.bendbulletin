class AddFileTypeToJobFiles < ActiveRecord::Migration
  def self.up
    add_column :job_files, :file_type, :string, :default => "job_file"
  end

  def self.down
    remove_column :job_files, :file_type
  end
end
