class QuestionsController < ApplicationController
  before_filter :user_signed_in?, only: :create
  before_filter :correct_user, only: :destroy

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.create(params[:question])
    if @question.save
      redirect_to question_index
    else
      redirect to question_index
    end
  end

  private

    def correct_user
      question = Question.find(params[:id])
      redirect_to root_url unless current_user && question.asker_id == current_user.id
    end
end
