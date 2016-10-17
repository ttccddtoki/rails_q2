class AnswerlistController < ApplicationController
  def index
    @@tmp_questions = nil
    @questions = get_questions
  end

  private

  def get_questions
    @@tmp_questions ||= Question.order("RANDOM()").limit(40)
  end
end
