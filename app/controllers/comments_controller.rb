class CommentsController < ApplicationController
  before_action :set_item
  def new
    @comment = Comment.new
  end

  def edit
    render :form
  end

  def create
    @comment = @item.comments.new(comment_params)
    if @comment.save
      redirect_to department_item_path(@item.department_id, @item)
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @item
    else
      render :form
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :author)
  end
end
