class Comments < ActiveRecord::Migration[6.0]
  def change
      create_table :comments do |t|
      t.references :group
      t.text :user_id
      t.text :comment
      t.timestamps
  end
end
end