class TodosController < ApplicationController
  before_action :set_todo, only: [:update, :destroy]

  # GET /todos
  def index
    render json: Todo.where(deleted: false), status: :ok
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      # render json: @todo, status: :ok
      render json: Todo.where(deleted: false), status: :ok
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      # render :show, status: :ok, location: @todo
      render json: Todo.where(deleted: false), status: :ok
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    if @todo.update deleted: true
      render json: Todo.where(deleted: false), status: :ok
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:text, :done, :deleted)
    end
end
