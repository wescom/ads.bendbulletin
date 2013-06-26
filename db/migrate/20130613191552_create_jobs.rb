class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.integer :upload_type_id
      t.integer :user_id

      t.string :name, :null => false
      t.string :company
      t.string :salesrep
      t.string :acct_no
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state, :limit => 2
      t.integer :zip, :limit => 5
      t.string :email
      t.string :phonenum
      t.string :phonenum2
      t.string :fax
      
      t.date   :startdate
      t.string :application
      t.string :application_other
      t.string :application_version
      t.string :platform
      t.string :image_format
      t.string :vector_format
      t.string :color_spec
      t.string :job_type
      t.boolean :trapping, :default => false
      t.string :files_to_run
      
      t.text :instructions

      t.timestamps
    end
    add_index :jobs, :name
    add_index :jobs, :upload_type_id
    add_index :jobs, :user_id
  end

  def self.down
    drop_table :jobs
  end
end
