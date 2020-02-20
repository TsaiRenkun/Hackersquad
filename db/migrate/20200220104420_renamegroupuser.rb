class Renamegroupuser < ActiveRecord::Migration[6.0]
  def change
    rename_table :groups_users, :attends_groups
  end
end