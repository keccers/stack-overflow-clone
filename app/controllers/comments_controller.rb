class CommentsController < ApplicationController
  before_filter :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.create(params[:comment])
    if @comment.valid?
      @commentable.instance_of?(Answer) ? (redirect_to @commentable.question) : (redirect_to @commentable)
    else
      @errors = @comment.errors.full_messages
      render "new"
    end
  end

  private

  def find_commentable
    klass, id = request.path.split('/')[1, 2]
    @commentable = klass.singularize.classify.constantize.find(id)
  end
end
