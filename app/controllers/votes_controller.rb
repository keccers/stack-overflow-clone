class VotesController < ApplicationController
  before_filter :user_signed_in?
  before_filter :find_votable

  def new
    @vote = Vote.new
  end

  def create
    @vote = current_user.votes.create(params[:vote])
    render partial: 'votes/vote', layout: false, locals: { votable: @vote.votable }
  end

  private

  def find_votable
    klass, id = request.path.split('/')[1, 2]
    @votable = klass.singularize.classify.constantize.find(id)
  end
end
