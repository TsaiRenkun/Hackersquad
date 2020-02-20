class AddRolesToEventsUsers < ActiveRecord::Migration[6.0]
  def change
     add_reference :events_users, :role
  end
end