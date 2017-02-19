class ProblemsController < ApplicationController
  before_action :authenticate_user!

  def show
    @problems = get_problems
    @problem = get_problem
    @problem_index = params[:id].to_i
  end

  def update
    if session[:result_list_id].nil?
      result_list = ResultList.create(user_id: current_user.id)
      session[:result_list_id] = result_list.id
    else
      result_list = ResultList.find(session[:result_list_id])
    end
    #INFO 前の問題(@problem)を取得
    prev_problem = get_problem
    if prev_problem.present?
      if params[:choice].blank?
        is_correct = false
      else
        is_correct = params[:choice][:id].to_i == prev_problem.answer
      end
      result = result_list.results.where(problem_id: prev_problem.id).last
      if result.nil?
        result = Result.create(problem_id: prev_problem.id)
      end
      result.is_correct = is_correct
      result_list.results << result
      result_list.save
    end

    if result_list.results.count >= 4
      restart
      redirect_to results_path(result_list_id: result_list.id)
    else
      next_problem_id = params[:id].to_i + 1
      redirect_to problem_path(next_problem_id)
    end
    #railsは一問25点
    result_list.points = result_list.results.where(is_correct: true).count * 2
    result_list.save
    current_user.result_lists << result_list
  end

  private
  def restart
    session[:problems] = nil
    session[:result_list_id] = nil
  end

  def get_problem(problem_id = nil)
    problem_index = params[:id].to_i if params[:id].present?
    problem_index -= 1 #Arrayのindexは0が最初の要素のため
    problem_id = session[:problems][problem_index]
    if problem_id.present?
      problem = Problem.find(problem_id)
    else
      nil
    end
  end

  def get_problems
    session[:problems] ||= Problem.order("RANDOM()").limit(40).pluck(:id)
    problems = Problem.where(id: session[:problems]).order_by_ids(session[:problems])
  end

end
