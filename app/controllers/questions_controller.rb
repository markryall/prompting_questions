class QuestionsController < ApplicationController
  def index
    @questions = Question.all.shuffle
    @questions = [] unless valid_token?
  end

  def show
    @question = Question.find params[:id]
    redirect_to '/' unless valid_token?
  end

  def answer
    unless valid_token?
      redirect_to '/'
      flash[:error] = "Sorry!"
      return
    end
    Answer.new.tap do |answer|
      answer.content = params[:content]
      answer.question_id = params[:id]
      answer.save
      flash[:success] = "Thanks for sharing your story!"
    end
    redirect_to "/?token=#{token}"
  end
private
  def token
    @token = params[:token]
  end

  def valid_token?
    token == ENV["TOKEN"]
  end
end
