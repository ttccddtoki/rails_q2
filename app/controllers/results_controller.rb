class ResultsController < ApplicationController
  def index
    @result_list = ResultList.last
  end
end
