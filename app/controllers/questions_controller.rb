class QuestionsController < ApplicationController
  before_filter :user_signed_in?, only: :new
  before_filter :correct_user, only: :destroy

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @vote   = Vote.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.create(params[:question])
    if @question.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def best_answer
    
  end

  private
  def correct_user
    question = Question.find(params[:id])
    redirect_to root_url unless current_user && question.asker_id == current_user.id
  end
end
