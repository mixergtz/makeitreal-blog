class RenameIsAuthorInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :is_author, :is_writer
  end
end
