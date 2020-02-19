class Events < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user
      t.text :name
      t.text :description
      t.date :date
      t.text :location
      t.text :img
      t.integer :max_group
      t.integer :max_per_group
      t.timestamps
    end
  end
end