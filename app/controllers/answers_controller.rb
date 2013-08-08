class AnswersController < ApplicationController
  before_filter :user_signed_in?
  def create
    @answer = current_user.answers.create(params[:answer])
    if @answer.valid?
      redirect_to @answer.question
    else
      @errors = @answer.errors
      render @answer.question
    end
  end
end
