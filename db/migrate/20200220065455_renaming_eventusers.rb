class RenamingEventusers < ActiveRecord::Migration[6.0]
  def change
     rename_table :events_users, :attends
  end
end