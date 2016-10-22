class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if session[:result_list_id].nil?
      result_list = ResultList.create(user_id: current_user.id)
      session[:result_list_id] = result_list.id
    end
    session[:questions] ||= Question.order("RANDOM()").limit(40)
    session[:question_number] ||= 0

    set_question
  end

  def next_question
    #INFO 前の問題(@question)を取得
    prev_question = Question.find(params[:question_id])
    is_correct = params[:choice][:id].to_i == prev_question.answer
    result = Result.create(is_correct: is_correct, question_id: prev_question.id)
    result_list = ResultList.find(session[:result_list_id])
    result_list.results << result
    result_list.points = result_list.results.select("is_correct").where(is_correct: true).count * 2.5
    result_list.save
    if session[:question_number] >= 3
      restart
      redirect_to results_path
    else
      #INFO question_numberを増やして次の問題(@question)を取得
      session[:question_number] += 1
      set_question
      render "index"
    end
  end

  private
  def restart
    session[:questions] = nil
    session[:question_number] = nil
    session[:result_list_id] = nil
  end

  def set_question
    questions = session[:questions]
    question_number = session[:question_number]
    if questions[question_number].class == Hash
      @question = Question.new(questions[question_number])
    else
      @question = questions[question_number]
    end
  end

end
