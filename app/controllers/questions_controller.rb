class QuestionsController < ApplicationController
  before_action :user_signed_in?, only: :create
  before_action :correct_user, only: :destroy






  private
    def correct_user
      question = Question.find(params[:id])
      redirect_to root_url unless current_user && question.asker_id == current_user.id
    end
end
