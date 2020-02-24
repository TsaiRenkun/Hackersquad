class RemoveUserIdFromComments < ActiveRecord::Migration[6.0]
  def change

    remove_column :comments, :user_id, :text
  end
end