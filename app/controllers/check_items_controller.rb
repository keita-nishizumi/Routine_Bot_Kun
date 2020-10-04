class CheckItemsController < ApplicationController

  def create
    check_item = CheckItem.create(check_item_params)
    render json:{ check_item: check_item }
  end

  private
  def check_item_params
    params.require(:check_item).permit(:text).merge(check_list_id: check_list_must_exists)
  end

  def check_list_must_exists
    if params[:check_list_id] != 'shouldCreateList'
      return params[:check_list_id]
    else
      return CheckList.create(routine_id: params[:routine_id], text: "created by check items controller")
    end
  end
end
