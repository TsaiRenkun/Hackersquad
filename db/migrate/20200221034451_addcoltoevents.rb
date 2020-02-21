class Addcoltoevents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :developer , :integer
    add_column :events, :ux , :integer
  end
end