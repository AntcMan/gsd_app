class TodoItemsController < ApplicationController
  def index
    @todo_items = TodoItem.all
  end

  # def new
  #   @todo_item = TodoItem.new
  # end

  # def create
  #   @todo_item = TodoItem.new(todo_item_params)

  #   if @todo_item.save
  #     redirect_to todo_items_path
  #   else
  #     render :new
  #   end
  # end

  # def edit
  #   @todo_item = TodoItem.find(params[:id])
  # end

  # def update
  #   @todo_item = TodoItem.find(params[:id])

  #   if @todo_item.update(todo_item_params)
  #     redirect_to todo_items_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @todo_item = TodoItem.find(params[:id])
  #   @todo_item.destroy

  #   redirect_to todo_items_path
  # end

  # private

  # def todo_item_params
  #   params.require(:todo_item).permit(:name, :completed)
  # end
end
