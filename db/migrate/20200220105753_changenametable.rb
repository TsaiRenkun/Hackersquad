class Changenametable < ActiveRecord::Migration[6.0]
  def change
    rename_column :attends_groups, :user_id, :attend_id
  end
end