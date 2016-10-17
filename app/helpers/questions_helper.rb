module QuestionsHelper
  def judge_last_question
    if question.question_number == 40
      'results/index'
    elsif
      'questions/index'
    end

end
