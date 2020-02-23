class Addcolumetogroups < ActiveRecord::Migration[6.0]
  def change
     add_column :groups, :developer , :integer
    add_column :groups, :ux , :integer
  end
end