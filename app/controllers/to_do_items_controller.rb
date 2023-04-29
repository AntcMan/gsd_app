class ToDoItemsController < ApplicationController
  # INDEX
  def index
    @todo_items = ToDoItem.all
  end

  # NEW TODO ITEMS
  def new
    @todo_item = ToDoItem.new
  end

  # CREATE TODO ITEMS
  def create
    @todo_item = ToDoItem.new(todo_item_params)
    if @todo_item.save
      redirect_to :index
    else
      render :new
    end
  end

  # EDIT TODO ITEMS
  def edit
    @todo_item = ToDo.find(params[:id])
  end

  # UPDATE TODO ITEMS
  def update
    @todo_item = ToDo.find(params[:id])
    if @todo_item.update(todo_item_params)
      redirect_to :index
    else
      render :edit
    end
  end

  # DESTROY TODO ITEMS
  def destroy
    @todo_item = ToDo.item.find(params[:id])
    @todo_item.:

    redirect_to :index
  end

  private

  def todo_item_params
    params.require(:todo_item).permit(:name, :description, :completed)
  end
end
