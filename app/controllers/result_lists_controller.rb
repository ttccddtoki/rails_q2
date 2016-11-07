class ResultListsController < ApplicationController
  def index
    @result_lists = current_user.result_lists.all
  end
end
