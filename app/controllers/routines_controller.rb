class RoutinesController < ApplicationController
  before_action :set_routine, only: [:edit, :update, :show]

  def index
    @routines = Routine.includes(:routine_users).where(user_id: current_user).where('routine_users.user_id': [current_user, nil]).references(:routine_users)
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

  private
  def routine_params
    params.require(:routine).permit(:name, :description).merge(user_id: current_user.id)
  end

  def set_routine
    @routine = Routine.find(params[:id])
  end
end
