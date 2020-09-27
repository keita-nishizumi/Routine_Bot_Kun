class RoutinesController < ApplicationController
  before_action :set_routine, only: [:edit, :update]

  def index
    # TODO: 後からログインしているユーザのルーティン一覧のみ取得するように改変する
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
    binding.pry
    @routine.update(routine_params)
  end

  private
  def routine_params
    params.require(:routine).permit(:name, :description).merge(user_id: current_user.id)
  end

  def set_routine
    @routine = Routine.find(params[:id])
  end
end
