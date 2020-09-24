class RoutinesController < ApplicationController
  def index
    # TODO: 後からログインしているユーザのルーティン一覧のみ取得するように改変する
    @routines = Routine.all
  end
end
