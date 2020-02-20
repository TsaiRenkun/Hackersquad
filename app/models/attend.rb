class Attend < ApplicationRecord
  belongs_to :role
  belongs_to :user
  belongs_to :event
  has_and_belongs_to_many :groups
end