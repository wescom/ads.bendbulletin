class AddWelcomeToGlobalSettings < ActiveRecord::Migration
  def self.up
    add_column :global_settings, :welcome, :text
  end

  def self.down
    remove_column :global_settings, :welcome
  end
end
