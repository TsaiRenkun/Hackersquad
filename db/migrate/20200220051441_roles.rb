class Roles < ActiveRecord::Migration[6.0]
  def change
     create_table :roles do |t|
      t.text :name
  end
  end
end