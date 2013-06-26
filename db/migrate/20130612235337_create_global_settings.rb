class CreateGlobalSettings < ActiveRecord::Migration
  def self.up
    create_table :global_settings do |t|
      t.text :general_instructions
      t.text :disclaimer
      t.string :contact_email
      t.timestamps
    end
  end

  def self.down
    drop_table :global_settings
  end
end
