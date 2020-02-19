class RemoveColumnFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :username, :text

    remove_column :users, :description, :text

    remove_column :users, :img, :text
  end
end
