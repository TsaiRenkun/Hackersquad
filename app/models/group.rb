class Group < ApplicationRecord
  belongs_to :event
  has_many :users
  has_many :attends
end