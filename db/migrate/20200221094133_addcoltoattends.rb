class Addcoltoattends < ActiveRecord::Migration[6.0]
  def change
    add_reference :attends, :group
  end
end