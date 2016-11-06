class ResultListsController < ApplicationController
  def index
    @result_lists = ResultList.all
  end
end
