class AnswersController < ApplicationController
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
