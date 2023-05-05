class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @progress = progress
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to :todos, notice: 'To-do list updated!'
    else
      render :new
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      if @todo.completed
        @progress = progress
        # @todo.destroy
      end
      # @progress = progress
      redirect_to todos_path
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end

  def progress
    completed_todos = Todo.where(completed: true).count
    total_todos = Todo.count
    progress = completed_todos.fdiv(total_todos) * 100
    progress.nan? ? 0 : progress
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description, :due_date, :completed)
  end
end
