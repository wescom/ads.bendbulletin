class AddDetailedInstructionsToUploadType < ActiveRecord::Migration
  def self.up
    add_column :upload_types, :detailed_instructions, :text
  end

  def self.down
    remove_column :upload_types, :detailed_instructions
  end
end
