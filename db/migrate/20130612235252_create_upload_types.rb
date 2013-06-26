class CreateUploadTypes < ActiveRecord::Migration
  def self.up
    create_table :upload_types do |t|
      t.string :name, :null => false
      t.string :tab_name, :null => false
      t.integer :tab_sort, :null => false, :default => 0
      t.text :description
      t.text :instructions
      t.string :email_recipient
      t.boolean :get_startdate, :default => false
      t.boolean :get_application_used, :default => false
      t.boolean :get_platform, :default => false
      t.boolean :get_image_format, :default => false
      t.boolean :get_image_format, :default => false
      t.boolean :get_vector_format, :default => false
      t.boolean :get_color_spec, :default => false
      t.boolean :get_job_type, :default => false
      t.boolean :get_trapping, :default => false
      t.boolean :get_files_to_run, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :upload_types
  end
end
