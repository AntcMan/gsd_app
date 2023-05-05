class TodosController < ApplicationController
  @total_items = Todo.count
  @completed_items = Todo.where(completed: true).count
  @percentage_complete = (@completed_items.to_f / @total_items.to_f) * 100

  def index
    @todos = Todo.all
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
        @todo.destroy
      end
      redirect_to todos_path
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end


  private

  def todo_params
    params.require(:todo).permit(:name, :description, :due_date, :completed)
  end

end
