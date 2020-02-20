class Groupsusers < ActiveRecord::Migration[6.0]
  def change
     create_table :groups_users do |t|
      t.references :user
      t.references :group
  end
  end
end