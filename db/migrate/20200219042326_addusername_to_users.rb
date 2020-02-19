class AddusernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username , :text
    add_column :users, :img , :text
    add_column :users, :description , :text
  end
end