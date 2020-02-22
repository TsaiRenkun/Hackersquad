class Attend < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :role
  belongs_to :group,  optional: true
end