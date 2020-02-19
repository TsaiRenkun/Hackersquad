class EventsUsers < ActiveRecord::Migration[6.0]
  def change
  create_table :events_users do |t|
  t.references :user
  t.references :event
  t.timestamps
    end
  end
end