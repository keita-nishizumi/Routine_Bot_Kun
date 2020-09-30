class RoutineUser < ApplicationRecord
  belongs_to :user
  belongs_to :routine

  def self.fetch_todays_routines(current_user)
    RoutineUser.where("user_id = ? AND NOW() BETWEEN start_date AND end_date", current_user).includes(:routine => {:check_list => :check_items}).order("time ASC")
  end
end
