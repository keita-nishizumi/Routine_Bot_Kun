class RoutinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_routine, only: [:edit, :update, :show]

  def index
    @routines = Routine.includes(:routine_users).where(user_id: current_user).where('routine_users.user_id': [current_user, nil]).references(:routine_users).order("routine_users.start_date ASC, routine_users.time ASC")
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.create(routine_params)
  end

  def edit
  end

  def update
    @routine.update(routine_params)
  end

  def show
  end

  def search
    @routines = Routine.search(params[:keyword])
  end

  private
  def routine_params
    params.require(:routine).permit(:name, :description).merge(user_id: current_user.id)
  end

  def set_routine
    @routine = Routine.includes(:check_list => :check_items).find(params[:id])
  end

end
