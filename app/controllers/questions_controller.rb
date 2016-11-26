class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def show
    @questions = get_questions
    @question = get_question
    @question_index = params[:id].to_i
  end

  def update
    if session[:result_list_id].nil?
      result_list = ResultList.create(user_id: current_user.id)
      session[:result_list_id] = result_list.id
    else
      result_list = ResultList.find(session[:result_list_id])
    end
    #INFO 前の問題(@question)を取得
    prev_question = get_question
    if prev_question.present?
      if params[:choice].blank?
        is_correct = false
      else
        is_correct = params[:choice][:id].to_i == prev_question.answer
      end
      result = result_list.results.where(question_id: prev_question.id).last
      if result.nil?
        result = Result.create(question_id: prev_question.id)
      end
      result.is_correct = is_correct
      result_list.results << result
      result_list.save
    end

    if result_list.results.count >= 4
      restart
      redirect_to results_path(result_list_id: result_list.id)
    else
      next_question_id = params[:id].to_i + 1
      redirect_to question_path(next_question_id)
    end
    result_list.points = result_list.results.where(is_correct: true).count * 2.5
    result_list.save
    current_user.result_lists << result_list
  end

  private
  def restart
    session[:questions] = nil
    session[:result_list_id] = nil
  end

  def get_question(question_id = nil)
    question_index = params[:id].to_i if params[:id].present?
    question_index -= 1 #Arrayのindexは0が最初の要素のため
    question_id = session[:questions][question_index]
    if question_id.present?
      question = Question.find(question_id)
    else
      nil
    end
  end

  def get_questions
    session[:questions] ||= Question.order("RANDOM()").limit(40).pluck(:id)
    questions = Question.where(id: session[:questions]).order_by_ids(session[:questions])
  end

end
