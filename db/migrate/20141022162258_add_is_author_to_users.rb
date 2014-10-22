class AddIsAuthorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_author, :boolean
  end
end
