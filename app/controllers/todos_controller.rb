class TodosController < ApplicationController
  def  new
    @todo=Todo.new
  end
  def create
   @todo=Todo.new(todo_params)
   if @todo.save
     flash[:notice]="Le trucs a ete bien ajouter comme il le fallait"
     redirect_to todos_path @todo
   else
     render 'new'
   end
  end
  def show
    if params[:format]
      @todo=Todo.find(params[:format])
    else
      @todo=Todo.all
    end
  end
  private
  def todo_params
    params.require(:todo).permit(:name,:description)
  end
end
