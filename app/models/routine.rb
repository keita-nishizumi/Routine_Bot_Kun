class Routine < ApplicationRecord
  belongs_to :user
  has_many :users, through: :routine_users
  has_many :routine_users
end
