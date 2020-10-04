class RoutineUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_routine_user, only: [:edit, :update]

  def index
    @routine_users = RoutineUser.fetch_todays_routines(current_user)
  end

  def new
    @routine_user = RoutineUser.new
  end

  def create
    @routine_user = RoutineUser.create(routine_user_params)
  end

  def edit
  end

  def update
    @routine_user.update(routine_user_params)
    redirect_to action: :index
  end

  private
  def routine_user_params
    params.require(:routine_user).permit(:id, :routine_id, :time, :start_date, :end_date).merge(routine_id: params[:routine_id], user_id: current_user.id)
  end

  def set_routine_user
    @routine_user = RoutineUser.find(params[:id])
  end
end
