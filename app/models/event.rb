class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :roles
  has_many :groups
end