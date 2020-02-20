class Groups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.references :event
      t.text :group_number
      t.timestamps
    end
  end
end