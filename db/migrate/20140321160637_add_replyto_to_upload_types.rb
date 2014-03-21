class AddReplytoToUploadTypes < ActiveRecord::Migration
  def self.up
    add_column :upload_types, :email_replyto, :string
  end

  def self.down
    remove_column :upload_types, :email_replyto
  end
end
