class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to :index, notice: 'To-do list updated!'
    else
      render :new
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description, :due_date, :completed)
  end
end
