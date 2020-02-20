class Attend < ApplicationRecord
  belongs_to :role
  belongs_to :user
  belongs_to :event
end