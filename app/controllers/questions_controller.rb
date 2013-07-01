class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find params[:id]
  end

  def answer
    Answer.new.tap do |answer|
      answer.content = params[:content]
      answer.question_id = params[:id]
      answer.save
      flash[:success] = "Thanks for answering this question!"
    end
    redirect_to '/'
  end
end
