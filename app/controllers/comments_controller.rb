class CommentsController < ApplicationController
  before_filter :user_signed_in?, only: :new
  before_filter :find_commentable

  def new
    @comment = Comment.new
    render partial: "new", layout: false, locals: { comment: @comment }
  end

  def create
    @comment = @commentable.comments.create(params[:comment])
    if @comment.valid?
      render partial: "comment", layout: false, locals: { comment: @comment }
    else
      @errors = @comment.errors.full_messages
      render partial: "comment", layout: false, locals: { comment: @comment }
    end
  end

  private

  def find_commentable
    klass, id = request.path.split('/')[1, 2]
    @commentable = klass.singularize.classify.constantize.find(id)
  end
end
