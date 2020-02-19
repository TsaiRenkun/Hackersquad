class Userprofiles < ActiveRecord::Migration[6.0]
  def change
  	create_table :userprofiles do |t|
  		t.references :user
  		t.string :username
  		t.string :description
  		t.string :img
	end
  end
end
