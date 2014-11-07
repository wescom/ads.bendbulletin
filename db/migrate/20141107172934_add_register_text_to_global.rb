class AddRegisterTextToGlobal < ActiveRecord::Migration
  def self.up
    add_column :global_settings, :register_text, :text
  end

  def self.down
    remove_column :global_settings, :register_text
  end
end
