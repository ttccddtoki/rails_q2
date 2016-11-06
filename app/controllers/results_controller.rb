class ResultsController < ApplicationController
  def index
    @result_list = ResultList.find(result_list_id = params[:result_list_id])
  end
end
