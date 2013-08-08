class VotesController < ApplicationController
  before_filter :find_votable

  def new
    @vote = Vote.new
  end

  def create
    @vote = current_user.votes.new(params[:vote])
    @errors = @vote.errors.full_messages unless @vote.save
    ( @vote.votable_type == "Question" ) ? ( redirect_to @vote.votable ) : ( redirect_to question_path(@vote.votable.question) )
  end

  private

  def find_votable
    klass, id = request.path.split('/')[1, 2]
    @votable = klass.singularize.classify.constantize.find(id)
  end
end
