class CreateJobFiles < ActiveRecord::Migration
  def self.up
    create_table :job_files do |t|
      t.integer :job_id
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at
      t.timestamp
    end
  end

  def self.down
    drop_table :job_files
  end
end
