class CommentsController < ApplicationController
  before_filter :find_commentable

  def new

  end

  private

  def find_commentable
    klass, id = request.path.split('/')[1, 2]
    @commentable = klass.singularize.classify.constantize.find(id)
  end
end
