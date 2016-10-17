class QuestionsController < ApplicationController
  def index
    @questions = get_questions
    @questions.each do |question|
      tmp_question_number = 0
      tmp_question_number += 1
      question.question_number = tmp_question_number
      question.save
    end
  end

  private

  def get_questions
    @@tmp_questions ||= Question.order("RANDOM()").limit(40)
  end
end
