class Routine < ApplicationRecord
  belongs_to :user
  has_many :users, through: :routine_users
  has_many :routine_users
  has_one :check_list

  def self.search(keyword)
    if keyword != ""
      Routine.where('name LIKE(?)', "%#{keyword}%").or(Routine.where('description LIKE(?)', "%#{keyword}%"))
    else
      Routine.all
    end
  end
end
