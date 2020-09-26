class RoutinesController < ApplicationController
  def index
    # TODO: 後からログインしているユーザのルーティン一覧のみ取得するように改変する
    @routines = Routine.all
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.save
  end

  private
def routine_params
    params.require(:routine).permit(:name, :description).merge(user_id: current_user.id)
  end
end
