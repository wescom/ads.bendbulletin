class CreateEmailTexts < ActiveRecord::Migration
  def self.up
    create_table :email_texts do |t|
      t.string :name
      t.string :email_type
      t.string :subject
      t.text :header
      t.text :pretext
      t.text :posttext
      t.boolean :show_contact_info, :default => true
      t.boolean :show_job_info, :default => true
      t.boolean :show_job_file_info, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :email_texts
  end
end
